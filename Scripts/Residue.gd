extends Area2D

var residueId : String = "";
onready var residueTexture = get_node("Sprite");
var isRecyclible: bool;

## variável que controla o poder se movimentar do resíduo
var moveResudue:bool = false;
## variável que permite que o residuo vá até a bandeja
var moveResidueToTray: bool = false
## referência ao timer
onready var timer = get_node("Timer");
## variável que verifica se o timer foi iniciado;
var timerInit: bool = false

var direction;

func _ready():
	Global.residuo = self;
	moveResidueToTray = true;

func _process(delta):
	print(global_position)
#	print(moveResidueToTray)
	# mover para cima na esteira

	if moveResidueToTray:
		var _speed = 2; # TODO: trocar pela variável correspondente a velocidade da esteira
		global_position = global_position.move_toward(Global.levelNode.trayPosition, _speed);
	
	checkPosition()
	
	if moveResudue:
		residueMoviment(delta)

## função para movimentar o residuo:
func residueMoviment(delta) -> void:
	direction = Input.get_axis("ui_left", "ui_right");
	var _speed: float = 32;
	
	if direction != 0:
		if direction > 0:
			global_position.x = global_position.x + 32;
		elif direction < 0:
			global_position.x = global_position.x - 32;

## função para checar posiçoes:
func checkPosition() -> void:
	# verifica se o resíduo chegou na bandeija
	if global_position == Global.levelNode.trayPosition:
		moveResidueToTray = false;
		moveResudue = true;
	else:
		moveResudue = false;
	
	# verifica se o resíduo entrou no buraco da direita
	if self.global_position == Global.levelNode.holeRightPos and !timerInit:
		print("estou no buraco direito")
		timer.start();
		timerInit = true;

	# verifica se o resíduo entrou no buraco da esquerda
	if self.global_position == Global.levelNode.holeLeftPos and !timerInit:
		print("estou no buraco esquerda")
		timer.start();
		timerInit = true;
		
## quando o tempo do resíduo acabar
func _on_Timer_timeout():
	queue_free();
	Global.instanciateResidue = true;
