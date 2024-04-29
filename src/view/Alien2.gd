extends CharacterBody2D

var player
var alienHP

@export var motor_scene: PackedScene
const motor = preload("res://Motor.tscn")

func _ready():
	player = get_node("/root/Level2/Farmer")
	$AlienN.visible = false
	alienHP = 3
	
func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction*200.0
	move_and_slide()

func takeHit():
	print("alien OUCH")
	alienHP -= 1
	if(alienHP == 0):
		die()

func die():
	var newMotor = motor.instantiate()
	get_parent().add_child(newMotor)
	newMotor.global_position = global_position
	queue_free()
