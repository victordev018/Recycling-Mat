extends Node2D

## referênias a posições de bandeja, buraco da direita e esquerda respectivamente
onready var trayPosition: Vector2 = Vector2(240, 144);
onready var holeRightPos: Vector2 = Vector2(272, 144);
onready var holeLeftPos: Vector2 = Vector2(208, 144);

## referência ao animatedSprite da esteira
onready var animation: AnimatedSprite = get_node("AnimatedSprite");

## referência ao label do score
onready var labelScore: Label = get_node("Score");

func _ready() -> void:
	Global.levelNode = self;

func _process(delta) -> void:
	labelScore.text = "Score: " + str(Global.score);
