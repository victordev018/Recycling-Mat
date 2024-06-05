extends Node

## Referência ao levelNode:
var levelNode = null;

func _ready():
	OS.window_size = Vector2(960, 540)
	OS.center_window()
