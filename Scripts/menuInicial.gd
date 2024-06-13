extends Control


func _ready():
		$controls/startButton.grab_focus()


func _on_startButton_pressed():
	## zerando o score
	Global.score = 0;
	get_tree().change_scene("res://Scenes/MainLevel.tscn")


func _on_tutorialButton_pressed():
	get_tree().change_scene("res://Scenes/Tutorial.tscn")


func _on_exitButton_pressed():
	get_tree().quit()
