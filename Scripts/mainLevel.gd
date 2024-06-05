extends Node2D

## referênias a posições de bandeja, buraco da direita e esquerda respectivamente
onready var trayPosition: Vector2 = Vector2(240, 144);
onready var holeRightPos: Vector2 = Vector2(272, 144);
onready var holeLeftPos: Vector2 = Vector2(208, 144);

func _ready() -> void:
	Global.levelNode = self;
