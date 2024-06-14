extends Control

## quando o jogo iniciar
func _ready():
	$controls/startButton.grab_focus()

## quando clicar no botão start
func _on_startButton_pressed():
	## zerando o score
	Global.score = 0;
	## muda para a cena do level principal
	get_tree().change_scene("res://Scenes/MainLevel.tscn")

## quando clicar no botão de tutorial
func _on_tutorialButton_pressed():
	## muda para a cena de tutorial
	get_tree().change_scene("res://Scenes/Tutorial.tscn")

## quando clicar no botão de exit
func _on_exitButton_pressed():
	## finaliza a execução do jogo
	get_tree().quit()
