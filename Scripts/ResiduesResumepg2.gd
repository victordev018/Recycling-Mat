extends Control


func _ready():
	$BackButton.grab_focus()

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/WinResumeMenu.tscn")



func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/ResiduesResume.tscn")
