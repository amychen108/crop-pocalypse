extends Node2D

func _ready():
	if get_tree().current_scene.name == "openScene": #only show on start menu
		$BGM.play()
		$OpenScreen.visible = true
		$highScoresLabel.visible = true
		$Button.visible = true
		$highScores/Button2.visible = true
