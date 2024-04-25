extends Node

var HP = 1
var scene_tree

func _ready():
	scene_tree = get_tree()
	$ufoHP.text = "UFO Health: " + str(HP)
	
func lose_health():
	HP-= 1
	$ufoHP.text = "UFO Health: " + str(HP)
	
func get_health():
	return HP
