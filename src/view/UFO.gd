extends Area2D

var scene_tree
var scoreLabel
var healthLabel
var lastSpawn = 0
var scoreInterval = 5
var flag = 0

func _ready():
	scene_tree = get_tree()
	scoreLabel = get_node("/root/Level3/Tractor3/Score")
	healthLabel = get_node("/root/Level3/UFO/ufoHealth")

func _process(delta):
	if scoreLabel.get_score() >= lastSpawn + scoreInterval:
		lastSpawn += scoreInterval
		flag = 1
		position.x = randf_range(-500, 1200)
		position.y = -200
		
func _on_area_entered(node):
	if node.name == "Tractor3":
		healthLabel.lose_health()
		$CLANK.play()
		flag = 0
		if healthLabel.get_health() == 0:
			get_tree().change_scene_to_file("res://YouWin.tscn") 

func _physics_process(delta):
	if flag == 0:
		if position.y > -200:
			position.y+= -40
		
	if flag == 1:
		position.x += 4
		position.y += 18
