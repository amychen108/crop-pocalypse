extends Button
var scene_tree

func _ready():
	scene_tree = get_tree()

func _pressed():
	scene_tree.change_scene_to_file("res://Level1.tscn")
