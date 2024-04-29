extends Node

var score = 0
var scene_tree

func _ready():
	scene_tree = get_tree() 
	$Count.text = "Score: " + str(score)

func gain_score(): #updates score label
	score+= 1
	$Count.text = "Score: " + str(score)

func get_score():
	return score
	

