extends Area2D

var scene_tree

func _ready():
	scene_tree = get_tree()

func _process(delta):
	pass

func _on_area_entered(node):
	if node.name == "Tractor3":
		get_tree().change_scene_to_file("res://YouWin.tscn") 
