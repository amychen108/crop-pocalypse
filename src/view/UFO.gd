extends Area2D

var scene_tree
var scoreScene
var scoreLabel
var healthLabel
var livesLabel
var highScores
var lastSpawn = 0
var scoreInterval = 11
var flag = 0

func _ready():
	scene_tree = get_tree()
	scoreLabel = get_node("/root/Level3/Tractor3/Score")
	healthLabel = get_node("/root/Level3/UFO/ufoHealth")
	livesLabel = get_node("/root/Level3/UFO/Lives")
	
	var scoreScene = preload("res://OpenScreen.tscn")
	var instance = scoreScene.instantiate()
	add_child(instance)
	highScores = get_node("/root/Level3/UFO/openScene/highScores")

func _process(delta):
	if scoreLabel.get_score() >= lastSpawn + scoreInterval: #UFO spawns at score intervals
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
			highScores.addScore(scoreLabel.get_score()) #save high score
			highScores.saveScores()
			get_tree().change_scene_to_file("res://YouWin.tscn") 

func _physics_process(delta):
	if flag == 0: #when UFO is hit, it retreats
		if position.y > -200:
			position.y+= -100
		
	if flag == 1: #when UFO spawns, it drifts diagonally downward
		$CollisionShape2D.disabled = false
		position.x += 4
		position.y += 18
		if position.y > 1750: #if off screen, player missed it
			livesLabel.lose_life()
			$ufoMiss.play()
			$CollisionShape2D.disabled = true #you cannot hit the UFO as it ascends
			flag = 0
			


