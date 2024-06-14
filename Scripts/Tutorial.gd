extends Control

## ao iniciar a cena
func _ready():
	$BackButton.grab_focus()

## quando clicar no botão Back to menu
func _on_BackButton_pressed():
	## muda para a cena de menu inicial
	get_tree().change_scene("res://Scenes/menuInicial.tscn")
