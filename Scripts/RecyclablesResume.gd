extends Control

## quando a cena for iniciada
func _ready():
	$Button.grab_focus()

## quando clicar no botão Next page
func _on_Button_pressed():
	## muda para a cena da próxima página	
	get_tree().change_scene("res://Scenes/RecycablesResumepg2.tscn")
