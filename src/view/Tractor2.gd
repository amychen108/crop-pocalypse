extends Area2D

var scene_tree
var player

func _ready():
	scene_tree = get_tree()
	player = get_node("/root/Level2/Farmer")
	
	
func _process(delta):
	$Parts.text = str(player.truckParts) + " / 5"
	if(player.truckParts == 1):
		$GreyTractor0.hide()
	if(player.truckParts == 2):
		$GreyTractor1.hide()
	if(player.truckParts == 3):
		$GreyTractor2.hide()
	if(player.truckParts == 4):
		$GreyTractor3.hide()
	if(player.truckParts == 5):
		$GreyTractor4.hide()
		$Parts.set("theme_override_colors/font_color", "YELLOW")
	
func _on_area_entered(area):
	if area.name == "Farmer" && player.truckParts >= 5:
		get_tree().change_scene_to_file("res://Level3.tscn") 
