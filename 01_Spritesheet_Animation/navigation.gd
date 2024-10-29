extends Node2D  

# Player movement speed in Pixel 
var speed = 200
	
func _process(delta):
	handle_movement(delta)

func handle_movement(delta):
	var input_vector = Vector2.ZERO

	# Handle keyboard input (WASD or arrow keys)
	if Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_UP):
		input_vector.y -= 1 
	elif Input.is_key_pressed(KEY_S) or Input.is_key_pressed(KEY_DOWN):
		input_vector.y += 1 
	elif Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_LEFT):
		input_vector.x -= 1 
	elif Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_RIGHT):
		input_vector.x += 1  
 
		
	# Handle controller input (left analog stick)
	input_vector.x += Input.get_joy_axis(0, JOY_AXIS_LEFT_X)
	input_vector.y += Input.get_joy_axis(0, JOY_AXIS_LEFT_Y)

	# Normalize diagonal movement (optional) 
	if input_vector.length() > 1:
		input_vector = input_vector.normalized()

	# Move the player based on the input
	$Sprite2D.position += input_vector * speed * delta
