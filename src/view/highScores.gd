extends Node

var highScores = [0,0,0]

func _ready():
	if FileAccess.file_exists("user://saveScores.dat"): #load scores from file if file exists
		highScores = loadScores()
	highScores.sort()
	highScores.reverse()
	highScores = [highScores[0]] + [highScores[1]] + [highScores[2]] #only display top 3 scores
	writeScores()

func writeScores():
	if get_tree().current_scene.name == "openScene": #should only show on open screen
		$scores.text = str(highScores[0]) + str(', ') + str(highScores[1]) + str(', ') + str(highScores[2])
		
func getScores():
	return highScores
	
func addScore(score):
	highScores = highScores + [score]

func loadScores():
	var file = FileAccess.open("user://saveScores.dat", FileAccess.READ)
	var scores = file.get_var()
	return scores
	
func saveScores():
	var file = FileAccess.open("user://saveScores.dat", FileAccess.WRITE)
	file.store_var(highScores)
	
func resetScores():
	highScores = [0,0,0]
	saveScores()
	
func _on_button_2_pressed():
	resetScores()
	writeScores()
