extends KinematicBody2D

export var speed = 200
var player = null

func _ready():
	# Aqui você pode encontrar o player se ele está na mesma cena.
	player = get_tree().get_root().get_node("Path/To/Player") # Altere o caminho para o caminho correto do seu player

func _physics_process(delta):
	if player:
		var direction = (player.position - position).normalized()
		var velocity = direction * speed
		move_and_slide(velocity)
