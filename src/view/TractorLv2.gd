extends Area2D
var scene_tree

# Called when the node enters the scene tree for the first time.
func _ready():
	scene_tree = get_tree()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_body_entered(node):
	print("Entered body name:", node.name)
	if node.name == "Farmer":
		print("Farmer touched the tractor")
		get_tree().change_scene_to_file("res://Level3.tscn") 
