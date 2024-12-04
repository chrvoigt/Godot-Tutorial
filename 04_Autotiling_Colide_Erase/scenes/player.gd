extends CharacterBody2D

# Player movement speed in pixels
var speed = 160 #vielfaches von 16 

@export var inv:Inv

@onready var collect_layer = get_tree().root.get_node("Game/Collectables") 
		
	  

func _ready():
	print('collectables: ', collect_layer)



func _process(delta):
	handle_movement(delta)

	var player_pos = global_position
	var tile_pos = collect_layer.local_to_map(player_pos)
	#print("Tile Position: ", tile_pos)
	
	var collectable_type = collect_layer.get_cell_source_id(tile_pos)
	if collectable_type > 0:
		print (collectable_type)
		collect_layer.erase_cell(tile_pos)
	# Get the Tile ID at the given position
	

func handle_movement(delta):
	var input_vector = Vector2.ZERO 
	
	# Handle keyboard input (WASD or arrow keys)
	if Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_UP):
		input_vector.y -= 1
	if Input.is_key_pressed(KEY_S) or Input.is_key_pressed(KEY_DOWN):
		input_vector.y += 1
	if Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_LEFT):
		input_vector.x -= 1
	if Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_RIGHT):
		input_vector.x += 1

	# Handle controller input (left analog stick)
	input_vector.x += Input.get_joy_axis(0, JOY_AXIS_LEFT_X)
	input_vector.y += Input.get_joy_axis(0, JOY_AXIS_LEFT_Y)

	# Normalize diagonal movement (optional) 
	if input_vector.length() > 1:
		input_vector = input_vector.normalized()

	# Set velocity based on input
	velocity = input_vector * speed

	# Use move_and_slide to move the player with collision handling
	move_and_slide()
