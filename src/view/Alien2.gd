extends CharacterBody2D

var player

func _ready():
	player = get_node("/root/Level2/Farmer")
	$AlienN.visible = false

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction*200.0
	move_and_slide()
