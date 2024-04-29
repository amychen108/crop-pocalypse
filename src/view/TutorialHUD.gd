extends CanvasLayer

func _ready():
	get_tree().paused = true #game starts paused until begin button is pressed

func _on_button_pressed():
	$Button.visible = false;
	$Label.visible = false;
	get_tree().paused = false
	
