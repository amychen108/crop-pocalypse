extends Area2D

var health
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var collision
var input
var alien

# Called when the node enters the scene tree for the first time.
func _ready():
	alien = get_node("Node2D/Alien")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _physics_process(delta):
	var screensize = get_viewport_rect().size
	input = Vector2()
	if Input.is_key_pressed(KEY_W):
		input.y = -10
	elif Input.is_key_pressed(KEY_S):
		input.y = 10
	if Input.is_key_pressed(KEY_A):
		input.x = -10
	elif Input.is_key_pressed(KEY_D):
		input.x = 10
	if Input.is_key_pressed(KEY_UP):
		input.y = -1
	elif Input.is_key_pressed(KEY_DOWN):
		input.y = 1
	if Input.is_key_pressed(KEY_LEFT):
		input.x = -1
	elif Input.is_key_pressed(KEY_RIGHT):
		input.x = 1
	position += input
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)


func _on_body_entered(body):
	$Health.lose_life()
