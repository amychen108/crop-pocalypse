extends Node2D

var width = 5
var height = 5
var grid = []

func _ready():
	# Initialize the grid with default values
	for y in range(height):
		for x in range(width):
			grid.append(0)

	# Example: Set some cells to 1
	set_cell(2, 2, 1)
	set_cell(3, 3, 1)

	# Example: Check if grid is complete
	print("Grid is complete? ", is_complete())

# Function to set the value of a cell at the specified coordinates
func set_cell(x, y, value):
	if is_valid_index(x, y):
		grid[y * width + x] = value
	else:
		print("Error: Index out of range.")

# Function to get the value of a cell at the specified coordinates
func get_cell(x, y):
	if is_valid_index(x, y):
		return grid[y * width + x]
	else:
		print("Error: Index out of range.")
		return 0 # Default value

# Function to check if the given coordinates are within the valid range
func is_valid_index(x, y):
	return x >= 0 && x < width && y >= 0 && y < height

# Function to check if the grid is complete (no ones left)
func is_complete():
	for value in grid:
		if value == 1:
			return false
	return true
