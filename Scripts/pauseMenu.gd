extends CanvasLayer

onready var resume_button = $controls/ResumeButton

## quando a cena de menu pause for iiciada
func _ready():
	## ative a visibilidade da cena
	visible = false
	
	
func _process(delta):
	pass
	
## função para abriri o menu pause
func _unhandled_input(event):
	## se a tecla ESC for clicada
	if event.is_action_pressed("ui_cancel"):
		## a visibilidade da cena passa a ser verdadeira
		visible = true
		## pausa a execução do jogo
		get_tree().paused = true
		resume_button.grab_focus()

## quando clicar no botão resume
func _on_ResumeButton_pressed():
	## a execução do jogo volta a ser verdadeira
	get_tree().paused = false
	## deixa a scena de pause invisível
	visible = false 

## quando clicar no botão Back to Menu
func _on_MenuButton_pressed():
	## muda para a cena de menu principal
	get_tree().change_scene("res://Scenes/menuInicial.tscn")
	## pausa a execução do jogo
	get_tree().paused = false

## quando clica no botão Exit game
func _on_ExitButton_pressed():
	## finaliza a execução do jogo
	get_tree().quit()
