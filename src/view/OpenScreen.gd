extends Node2D

func _ready():
	if get_tree().current_scene.name == "openScene":
		$BGM.play()
		$OpenScreen.visible = true
		$highScoresLabel.visible = true
		$Button.visible = true
