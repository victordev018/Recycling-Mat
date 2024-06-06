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
## variável que verifica se o timer foi iniciado
var timerInit: bool = false
## variável que verifica se o timerChoice foi iniciado
var isPlayingTimerChoice: bool = false;

var direction;

func _ready():
	Global.residuo = self;
	moveResidueToTray = true;

func _process(delta):
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
		## verificando se o choice timer não foi iniciado:
		if !isPlayingTimerChoice:
			Global.levelNode.choiceTimer.start();
			isPlayingTimerChoice = true;
		Global.levelNode.animation.playing = false;
		moveResidueToTray = false;
		moveResudue = true;
	else:
		moveResudue = false;
	
	# verifica se o resíduo entrou no buraco da direita
	if self.global_position == Global.levelNode.holeRightPos and !timerInit:
		print("estou no buraco direito")
		Global.levelNode.choiceTimer.stop();
		isPlayingTimerChoice = false;
		checkRecyclable(true, 10);
		timer.start();
		timerInit = true;

	# verifica se o resíduo entrou no buraco da esquerda
	if self.global_position == Global.levelNode.holeLeftPos and !timerInit:
		print("estou no buraco esquerda")
		Global.levelNode.choiceTimer.stop();
		isPlayingTimerChoice = false;
		checkRecyclable(false, 10);
		timer.start();
		timerInit = true;
		
## quando o tempo do resíduo acabar
func _on_Timer_timeout():
	queue_free();
	Global.instanciateResidue = true;
	
## função para verificar se o player acertou se o resíduo é ou não reciclável
func checkRecyclable(condition: bool, points:int) -> void:
	if isRecyclible == condition:
		Global.score += points;
		Global.soundCorrectAnswer.play();
		Global.timerSound.start();
		
	else:
		Global.score -= points/2;
		Global.soundErrorAnswer.play()
		Global.timerSound.start();
	
