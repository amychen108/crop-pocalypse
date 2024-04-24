extends Area2D

var scene_tree

func _ready():
	scene_tree = get_tree()

func _on_area_entered(area):
	if area.name == "Farmhand":
		get_tree().change_scene_to_file("res://Level2.tscn")
