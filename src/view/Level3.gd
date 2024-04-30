extends Node2D

@export var alien_scene: PackedScene
const sc = preload("res://Alien3.gd")

func _ready():
	$SpawnTimer.start()
	$LV3.play()

func _on_spawn_timer_timeout():
	var al = alien_scene.instantiate() #create alien children
	al.set_script(sc)
	
	var al_spawn_loc = $SpawnPath/SpawnFollow #set movement direction and move
	al_spawn_loc.progress_ratio = randf()
	
	var direction = al_spawn_loc.rotation + PI / 2
	
	al.position = al_spawn_loc.position
	
	direction += randf_range(-PI/4, PI/4)
	
	var velocity = Vector2(randf_range(500, 700), 0)
	al.velocity = velocity.rotated(direction)
	
	add_child(al)
	

