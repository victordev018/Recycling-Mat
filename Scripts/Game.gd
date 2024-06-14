extends Node
class_name Game

## pre carregamento da cena Residue
onready var residueScene : PackedScene = preload("res://Scenes/Residue.tscn");
onready var levelNode : Node2D = get_parent();

## array de resíduos que ja foram instanciados:
var residuesAlreadyInstantiate: Array = [];

func _ready():
	Global.instanciateResidue = true;
	
func _process(delta):
	# instanciar residuos ao apertar tecla enter
	
	## se clicar na tecla definida e poder instanciar produto for verdadeito
	if Input.is_action_just_pressed("ui_accept") and Global.instanciateResidue:
		createResidue();   # cria novo resíduo
		Global.instanciateResidue = false;   # não pode criar resíduo
			

## Cria e posiciona uma instância de resíduo no jogo na posição apropriada
func createResidue(): 
	## ativa a animação da esteira
	Global.levelNode.animation.playing = true;
	print("criando resíduo");
	# instanciar cena de resíduo
	# obter chave aleatória
	var _residueKey = getRandomResidueKey();
	## se a existir uma chave
	if _residueKey != "":
		## cria-se uma instância da cena resíduo
		var _residue = residueScene.instance();
		## adiciona como filha da cena atual
		levelNode.add_child(_residue);
		# atribuir propriedades do resíduo (textura, isRecyclable, position)
		_residue.residueTexture.texture = Global.residueDatabase.get(_residueKey).get("texture");
		_residue.isRecyclible = Global.residueDatabase.get(_residueKey).get("recyclable");
		_residue.global_position = Vector2(get_viewport().size.x / 2, get_viewport().size.y + 32);
	## quando não existir mais chave
	else:
		## muda para a cena de WinScore
		get_tree().change_scene("res://Scenes/WinScreen.tscn")
		print("acabou o game")

 ## função para pegar uma chave aleatória do dicionário
func getRandomResidueKey() -> String:
	randomize();
	## cria array de string com as chaves do dicionário residueDatabase
	var _keys = Global.residueDatabase.keys()
	## verifica se a quantidade de residuos que foram instanciados é menor que a quantidade de chaves que temos em nosso array de chaves (_keys)
	if len(residuesAlreadyInstantiate) < len(_keys):## TODO: indroduza uma função para gerar mais ações quando usar todos os residuos
		var _index = randi() % len(_keys);
		## se a chave atual ja foi instanciada, pegue outra que não tenha sido instanciada
		while (_keys[_index] in residuesAlreadyInstantiate):
			_index = randi() % len(_keys);
		## atualiza a lista dos residuos instanciados
		residuesAlreadyInstantiate.append(_keys[_index]);
		## retorna a chave
		return _keys[_index];
	return "";
