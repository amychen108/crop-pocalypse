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
		position.x = randf_range(-500, 900) 
		position.y = -300
		
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
		if position.y > -300:
			position.y+= -80
		
	if flag == 1: #when UFO spawns, it drifts diagonally downward
		$Abductee.hide()
		$CollisionShape2D.disabled = false
		position.x += 4
		position.y += 18
		if position.y > 1750: #if off screen, player missed it
			$ufoMiss.play()
			livesLabel.lose_life()
			for i in range(scoreInterval+5):
				scoreLabel.lose_score()
			lastSpawn = scoreLabel.get_score()
			$CollisionShape2D.disabled = true #you cannot hit the UFO as it ascends
			$Abductee.show() 
			flag = 2
		
	if flag == 2: #slower ascent for abducting the cow
		if position.y > -300:
			position.y += -10


