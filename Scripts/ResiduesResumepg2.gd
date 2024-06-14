extends Control

## quando a cena iniciar
func _ready():
	$BackButton.grab_focus()

## quando clicar no botão Back to menu
func _on_Button_pressed():
	## muda para a cena de seleção de dados dos resíduos por categoria
	get_tree().change_scene("res://Scenes/WinResumeMenu.tscn")

## quando clicar no botão Back
func _on_BackButton_pressed():
	## muda para a cena de pagina 1 dos dados da categoria
	get_tree().change_scene("res://Scenes/ResiduesResume.tscn")
