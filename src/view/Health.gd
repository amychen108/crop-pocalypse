extends Node

var lives = 3
var scene_tree

# Called when the node enters the scene tree for the first time.
func _ready():
	scene_tree = get_tree()
	$Lives.text = "Lives: " + str(lives)

func lose_life():
	lives -= 1
	$Lives.text = "Lives: " + str(lives) 
	if lives <= 0:
		scene_tree.change_scene_to_file("res://YouLose.tscn")

func get_lives():
	return lives
