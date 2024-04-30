extends Node

var score = 0

func _process(delta):
	$Count.text = "Score: " + str(score)

func gain_score(): #updates score label
	score+= 1

func lose_score():
	score-= 1

func get_score():
	return score
