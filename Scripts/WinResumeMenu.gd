extends Control

## quando a cena for iniciada
func _ready():
	$VBoxContainer/Reciclaveis.grab_focus()

## quando clicar no botão Recyclable
func _on_Reciclaveis_pressed():
	## muda para a cena de informações sobre os resíduos recicláveis
	get_tree().change_scene("res://Scenes/RecyclablesResume.tscn")

## quando clicar no botão Not Recyclabe
func _on_NReciclaveis_pressed():
	## muda para a cena de informações sobre os resíduos não recicláveis
	get_tree().change_scene("res://Scenes/ResiduesResume.tscn")

## quando clicar no botão Back to menu
func _on_BackButton_pressed():
	## muda para a cena de menu inicial
	get_tree().change_scene("res://Scenes/menuInicial.tscn")
