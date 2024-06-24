extends Node2D

## referênias a posições de bandeja, buraco da direita e esquerda respectivamente
onready var trayPosition: Vector2 = Vector2(240, 144);
onready var holeRightPos: Vector2 = Vector2(272, 144);
onready var holeLeftPos: Vector2 = Vector2(208, 144);

## referência ao animatedSprite da esteira
onready var animation: AnimatedSprite = get_node("AnimatedSprite");

## referência ao label do score e choiceTimer, respectivamente
onready var labelScore: Label = get_node("Labels/Score");
onready var labelChoiceTimer: Label = get_node("Labels/ChoiceTimer");

## referência ao tempo de escolha do tipo de resíduo
onready var choiceTimer: Timer = get_node("ChoiceTimer");

## quando a partida iniciar
func _ready() -> void:
	## informe a global que eu sou o no do level
	Global.levelNode = self;

## a cada quadro por segundo
func _process(delta) -> void:
	## atualize o texto do salbel do score com o score atual
	labelScore.text = "Score: " + str(Global.score);
	## atualize o tempo de escolha
	labelChoiceTimer.text = "Timer: " + str(int(choiceTimer.time_left))

## quando o choice timer acabar:
func _on_ChoiceTimer_timeout():
	print("Tempo de escolha esgotado!");
	## pontos a serem decrementados
	var _points = 5;
	## decrementando pontos do score
	Global.score -= _points;
	## deletando cena do resíduo da cena mainLevel
	Global.residuo.queue_free()
	## pode instanciar um novo resíduo
	Global.instanciateResidue = true;
	# var que decide se um resíduo pode subir pela esteira
	Global.up = false;
