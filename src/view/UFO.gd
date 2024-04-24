extends Area2D

var scene_tree
var scoreLabel
var lastSpawn = 0
var scoreInterval = 5

func _ready():
	scene_tree = get_tree()
	scoreLabel = get_node("/root/Level3/Tractor3/Score")

func _process(delta):
	if scoreLabel.get_score() >= lastSpawn + scoreInterval:
		lastSpawn += scoreInterval
		print("spawn ufo")

func _on_area_entered(node):
	if node.name == "Tractor3":
		get_tree().change_scene_to_file("res://YouWin.tscn") 
