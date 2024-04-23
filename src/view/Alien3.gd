extends CharacterBody2D

var player
func _ready():
		player = get_node("/root/Node2D/Tractor")
		$Area2D.body_entered.connect(Callable(self,"_on_area_2d_body_entered"))
func _physics_process(delta):
	# Add the gravity.
	var direction = global_position.direction_to(player.global_position)
	velocity = direction*300.0
	move_and_slide()

func _on_area_2d_body_entered(body):
	if body is Player:
		$AudioStreamPlayer2.play()
	pass # Replace with function body.
