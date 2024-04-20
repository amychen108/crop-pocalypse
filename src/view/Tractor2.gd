extends Area2D

var scene_tree

func _ready():
	scene_tree = get_tree()

func _process(delta):
	pass

func _on_area_entered(area):
	if area.name == "Farmer":
		get_tree().change_scene_to_file("res://Level3.tscn") 
