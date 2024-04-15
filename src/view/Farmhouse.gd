extends Area2D
var scene_tree

# Called when the node enters the scene tree for the first time.
func _ready():
	scene_tree = get_tree()
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(node):
	# Check if the entering body is the one you expect
	print("Entered body name:", node.name)
	if node.name == "FarmHand2":
		print("Farm touched the house")
	get_tree().change_scene_to_file("res://Level2.tscn")
	


