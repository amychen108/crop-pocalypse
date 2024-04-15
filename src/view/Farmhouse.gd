extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	pass

# Called when another physics body enters the area
func _on_Area2D_body_entered(body):
	# Check if the entering body is the one you expect
	print("Entered body name:", body.name)
	if body.name == "FarmHand2":
		print("Farm touched the house")
