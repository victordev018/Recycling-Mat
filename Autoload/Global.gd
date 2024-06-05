extends Node

## Referência ao levelNode:
var levelNode = null;
## variavel que controla se pode ou não instanciar um residuo
var instanciateResidue: bool;
## referencia ao residuo
var residuo = null;

func _ready():
	OS.window_size = Vector2(960, 540)
	OS.center_window()
