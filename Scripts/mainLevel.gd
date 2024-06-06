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

func _ready() -> void:
	Global.levelNode = self;

func _process(delta) -> void:
	labelScore.text = "Score: " + str(Global.score);
	labelChoiceTimer.text = "Timer: " + str(int(choiceTimer.time_left))

## quando o choice timer acabar:
func _on_ChoiceTimer_timeout():
	print("Tempo de escolha esgotado ._.");
	var _points = 5;
	Global.score -= _points;
	Global.residuo.queue_free()
	Global.instanciateResidue = true;
