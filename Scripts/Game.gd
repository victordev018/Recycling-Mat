extends Node
class_name Game

onready var residueScene : PackedScene = preload("res://Scenes/Residue.tscn");
onready var levelNode : Node2D = get_parent();

## array de resíduos que ja foram instanciados:
var residuesAlreadyInstantiate: Array = [];

func _ready():
#	Global.soundCorrectAnswer.play()
	Global.instanciateResidue = true;
	
func _process(delta):
	# instanciar residuos ao apertar tecla teste
	if Input.is_action_just_pressed("ui_accept") and Global.instanciateResidue:
		createResidue();
		Global.instanciateResidue = false;
			

## Cria e posiciona uma instância de resíduo no jogo na posição apropriada
func createResidue(): 
	Global.levelNode.animation.playing = true;
	print("criando resíduo"); 
	# instanciar cena de resíduo
	var _residue = residueScene.instance();
	levelNode.add_child(_residue);
	# obter chave aleatória
	var _residueKey = getRandomResidueKey();
	if _residueKey != "":
		# atribuir sprite devido ao resíduo
		_residue.residueTexture.texture = Global.residueDatabase.get(_residueKey).get("texture");
		_residue.isRecyclible = Global.residueDatabase.get(_residueKey).get("recyclable");
		_residue.global_position = Vector2(get_viewport().size.x / 2, get_viewport().size.y + 32);

 ## função para pegar uma chave aleatória do dicionário
func getRandomResidueKey() -> String:
	## cria array de string com as chaves do dicionário residueDatabase
	var _keys = Global.residueDatabase.keys()
	## verifica se a quantidade de residuos que foram instanciados é igaual a 
	## quantidade de chaves que temos em nosso array de chaves (_keys)
	if len(residuesAlreadyInstantiate) == len(_keys):## TODO: indroduza uma função para gerar mais ações quando usar todos os residuos
		return ""
	var _index = randi() % len(_keys);
	## se a chave atual ja foi instanciada, pegue outra que não tenha sido instanciada
	while (_keys[_index] in residuesAlreadyInstantiate):
		_index = randi() % len(_keys);
	## atualiza a lista dos residuos instanciados
	residuesAlreadyInstantiate.append(_keys[_index])
	return _keys[_index];

