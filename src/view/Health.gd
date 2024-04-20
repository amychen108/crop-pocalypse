extends Node

var lives = 3
var scene_tree

func _ready():
	scene_tree = get_tree()
	$Lives.text = "Lives: " + str(lives)

func lose_life():
	lives-= 1
	$Lives.text = "Lives: " + str(lives)
	if lives <= 0:
		scene_tree.change_scene_to_file("res://YouLose.tscn")

func get_lives():
	return lives
	

