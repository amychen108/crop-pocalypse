extends Area2D

var n = 7
var truckParts = 0

func _physics_process(delta):
	var screensize = get_viewport_rect().size
	var input = Vector2()
	
	$Hurtbox.disabled = false
	$Hitbox.disabled = true
	
	if Input.is_key_pressed(KEY_W):
		input.y = -n
	elif Input.is_key_pressed(KEY_S):
		input.y = n
	if Input.is_key_pressed(KEY_A):
		input.x = -n
	elif Input.is_key_pressed(KEY_D):
		input.x = n
		
	position += input
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)
	
	if Input.is_key_pressed(KEY_SPACE):
		$Hurtbox.disabled = true
		$Hitbox.disabled = false

func _on_body_entered(body):
	if(body.is_in_group("alien")):
		if($Hurtbox.disabled == false): #farmer isn't attacking
			$Health.lose_life()
			$OOF.play()

		if($Hurtbox.disabled == true && $hitTimer.is_stopped() == true): #farmer is attacking and attack cooldown has elapsed
			$hitTimer.start()
			body.takeHit()

func _on_timer_timeout():
	print("hit cooldown elapsed")
	$hitTimer.stop()

func _on_area_entered(area):
	if(area.is_in_group("motor") && $Hurtbox.disabled == false): #must pick up motors with body
		truckParts += 1
		area.queue_free()
