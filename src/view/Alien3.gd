extends CharacterBody2D

var player

func _ready():
	player = get_node("/root/Level3/Tractor3")
	$Alien.visible = false

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal()) #collision should bounce away from each other

func _process(delta):
	if (position.x > 1700 or position.x < -200) or (position.y > 1700 or position.y < -200):
		queue_free() #remove from queue if off screen
		
