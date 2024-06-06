extends Node

## Referência ao levelNode:
var levelNode = null;
## variavel que controla se pode ou não instanciar um residuo
var instanciateResidue: bool;
## referencia ao residuo
var residuo = null;
## score de acertos do player
var score: int = 0;
## efeitos sonoros para reposta certa e errada, respectivamente
onready var soundCorrectAnswer = get_node("Sounds/CorrectAnswer");
onready var soundErrorAnswer = get_node("Sounds/ErrorAnswer");
## referência a câmera principal do jogo
var camera = null
## referência ao tempo de música
onready var timerSound = get_node("Timer");


## resíduos database.
var residueDatabase: Dictionary = {
	"cigarette": {
		"texture": preload("res://Assets-Residuos/Não Reciclaveis/Cigarro.png"),
		"recyclable": false
	},
	"packaging": {
		"texture": preload("res://Assets-Residuos/Não Reciclaveis/Embalagem Salgadinho.png"),
		"recyclable": false
	},
	"mirror": {
		"texture": preload("res://Assets-Residuos/Não Reciclaveis/Espelho.png"),
		"recyclable": false
	},
	"bulb": {
		"texture": preload("res://Assets-Residuos/Não Reciclaveis/lâmpada.png"),
		"recyclable": false
	},
	"monitor": {
		"texture": preload("res://Assets-Residuos/Não Reciclaveis/Monitor.png"),
		"recyclable": false		
	},
	"glasses": {
		"texture": preload("res://Assets-Residuos/Não Reciclaveis/Oculos.png"),
		"recyclable": false
	},
	"toiletPaper":{
		"texture": preload("res://Assets-Residuos/Não Reciclaveis/Papel Higiênico.png"),
		"recyclable": false
	},
	"cardboardBox": {
		"texture": preload("res://Assets-Residuos/Recicláveis/Caixa de Papelão.png"),
		"recyclable": true
	},
	"coke": {
		"texture": preload("res://Assets-Residuos/Recicláveis/Coke-32.png"),
		"recyclable": true
	},
	"waterBottle": {
		"texture": preload("res://Assets-Residuos/Recicláveis/Garrafa de água.png"),
		"recyclable": true
	},
	"shoe": {
		"texture": preload("res://Assets-Residuos/Recicláveis/Tênis.png"),
		"recyclable": true
	},
	"oil": {
		"texture": preload("res://Assets-Residuos/Recicláveis/Óleo de cozinha.png"),
		"recyclable": true
	}
}

func _ready():
	OS.window_size = Vector2(960, 540)
	OS.center_window()
	
func _on_Timer_timeout():
	soundCorrectAnswer.stop();
	soundErrorAnswer.stop();
	
