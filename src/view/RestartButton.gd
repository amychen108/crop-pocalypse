extends Button

var scene_tree

# Called when the node enters the scene tree for the first time.
func _ready():
	# Initialize scene_tree after the node has entered the scene tree
	scene_tree = get_tree()

# Called when the button is clicked
func _pressed():
	# Change to the Level1 scene
	scene_tree.change_scene_to_file("res://OpenScreen.tscn")
