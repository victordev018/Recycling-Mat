extends Area2D

var residueId : String = "";

func _process(delta):
	# mover para cima na esteira
	var _speed = 2; # TODO: trocar pela variável correspondente a velocidade da esteira
	global_position = global_position.move_toward(Vector2(240, 144), _speed);
