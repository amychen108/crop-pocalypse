extends CanvasLayer

func _ready():
	get_tree().paused = true

func _on_button_pressed():
	$Button.visible = false;
	$Label.visible = false;
	get_tree().paused = false
	
