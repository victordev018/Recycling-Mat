extends Control

## referência ao label do score
onready var label = $Label

## quando a cena for iniciada
func _ready():
	$Button.grab_focus()

## a cada taxa de quadro por segundo
func _process(delta):
	## atualize o label de score com o score atual da global
	label.text = "Parabéns!! seu score foi  " + str(Global.score) + "  pontos" 

## quando clicar no botão resumo dos residuuos
func _on_Button_pressed():
	## muda para a cena de seleção de escolha de categoria dos resíduos
	get_tree().change_scene("res://Scenes/WinResumeMenu.tscn")
