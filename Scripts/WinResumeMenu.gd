extends Control


func _ready():
	$VBoxContainer/Reciclaveis.grab_focus()

func _on_Reciclaveis_pressed():
	get_tree().change_scene("res://Scenes/RecyclablesResume.tscn")


func _on_NReciclaveis_pressed():
	get_tree().change_scene("res://Scenes/ResiduesResume.tscn")


func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/menuInicial.tscn")
