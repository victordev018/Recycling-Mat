extends Control

## ao iniciar a cena
func _ready():
	$Button.grab_focus()
	
## quando clicar no botão Next paga
func _on_Button_pressed():
	## muda para cena da próxima página de informações
	get_tree().change_scene("res://Scenes/ResiduesResumepg2.tscn")
