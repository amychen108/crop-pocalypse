extends CharacterBody2D

var player

func _ready():
	player = get_node("/root/Level1/Farmhand")
	$Alien.visible = false #hide alien with motor
	$CollisionFootL.disabled = true #foot collisions are only for level2 for more lenient hits
	$CollisionFootR.disabled = true

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position) #track and follow player
	velocity = direction*200.0
	move_and_slide()
