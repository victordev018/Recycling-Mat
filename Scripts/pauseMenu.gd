extends CanvasLayer

onready var resume_button = $controls/ResumeButton

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	
	
func _process(delta):
	pass
	

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		visible = true
		get_tree().paused = true
		resume_button.grab_focus()

func _on_ResumeButton_pressed():
	get_tree().paused = false
	visible = false 


func _on_MenuButton_pressed():
	get_tree().change_scene("res://Scenes/menuInicial.tscn")
	get_tree().paused = false


func _on_ExitButton_pressed():
	get_tree().quit()
