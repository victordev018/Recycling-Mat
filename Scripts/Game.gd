extends Node
class_name Game

onready var residueScene : PackedScene = preload("res://Scenes/Residue.tscn");
onready var levelNode : Node2D = get_parent();

## Cria e posiciona uma instância de resíduo no jogo na posição apropriada
func createResidue(): 
	print("criando resíduo"); 
	# instanciar cena de resíduo
	var _residue = residueScene.instance();
	levelNode.add_child(_residue);
	_residue.global_position = Vector2(get_viewport().size.x / 2, get_viewport().size.y + 32);
	
func _process(delta):
	# instanciar residuos ao apertar tecla teste
	if Input.is_action_just_pressed("ui_accept"):
		createResidue();
