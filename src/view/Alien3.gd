extends CharacterBody2D

var player

func _ready():
	player = get_node("/root/Level3/Tractor3")
	$Alien.visible = false

func _physics_process(delta):
	move_and_slide()
