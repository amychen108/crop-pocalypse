extends Node

var highScores = [0,0,0]

func _ready():
	highScores = loadScores()
	highScores.sort()
	highScores.reverse()
	if get_tree().current_scene.name == "openScene":
		$scores.text = str(highScores[0]) + str('\n') + str(highScores[1]) + str('\n') + str(highScores[2])
	
func getScores():
	return highScores
	
func addScore(score):
	highScores = highScores + [score]

func loadScores():
	var file = FileAccess.open("user://saveScores.dat", FileAccess.READ)
	var scores = file.get_var()
	return scores
