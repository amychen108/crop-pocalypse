extends Node2D

func _ready():
	if get_tree().current_scene.name == "loseScene":
		$LOSE.play()
		
	if get_tree().current_scene.name == "winScene":
		$WIN.play()
