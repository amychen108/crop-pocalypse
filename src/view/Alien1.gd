extends CharacterBody2D

var player

func _ready():
	player = get_node("/root/Node2D/FarmHand2")
	$Alien.visible = false

func _physics_process(delta):
	# Add the gravity.
	var direction = global_position.direction_to(player.global_position)
	velocity = direction*200.0
	move_and_slide()
