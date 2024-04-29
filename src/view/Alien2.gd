extends CharacterBody2D

var player
var alienHP = 3
var hurtSound
var hitflashAnim

@export var motor_scene: PackedScene
const motor = preload("res://Motor.tscn")

func _ready():
	player = get_node("/root/Level2/Farmer")
	hurtSound = get_node("/root/Level2/alienHurt")
	$AlienN.visible = false
	hitflashAnim = $hitflashAnim
	
func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction*200.0
	move_and_slide()

func takeHit():
	alienHP -= 1
	hitflashAnim.play("hitflash")
	hurtSound.play()
	if(alienHP == 0):
		die()

func die():
	var newMotor = motor.instantiate() #replace alien with motor part to pick up
	get_parent().add_child(newMotor)
	newMotor.global_position = global_position
	queue_free()
