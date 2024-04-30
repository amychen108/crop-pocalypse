extends Node

var HP = 4
var scene_tree

func _ready():
	scene_tree = get_tree()
	$ufoHP.text = "UFO Health: " + str(HP)
	
func lose_health(): #update UFO HP label
	HP-= 1
	$ufoHP.text = "UFO Health: " + str(HP)
	
func get_health():
	return HP
