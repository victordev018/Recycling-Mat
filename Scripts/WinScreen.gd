extends Control

onready var label = $Label

func _ready():
	$Button.grab_focus()

func _process(delta):
	label.text = "Parabéns!! seu score foi " + str(Global.score) + " pontos"

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/WinResumeMenu.tscn")
