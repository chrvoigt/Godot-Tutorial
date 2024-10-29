# File: player.gd
extends Node2D  

# Player movement speed in Pixel 
var speed = 150

#follow the mouse 
var use_mouse = false
var target_position: Vector2 = Vector2(100,100)

# Reference to the AnimationPlayer
@onready var anim_player = $AnimationPlayer

func _ready():
	 # Set the initial target position to the current sprite position
	target_position = $Sprite2D.position
	
func _process(delta):
	handle_movement(delta)
	if use_mouse:
		move_to_target(delta)
	
func _input (event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		target_position = get_global_mouse_position()	
		use_mouse = true
	
func move_to_target(delta): 
	var current_position = $Sprite2D.position
	# Calculate the direction vector from the current position to the target
	var direction = target_position - current_position
	if direction.length() > 2:  # Tolerance to stop jittering when close enough
		direction = direction.normalized()  # Normalize the direction
		$Sprite2D.position += direction * speed * delta  # Move the sprite towards the target
	else:
		use_mouse = false


func handle_movement(delta):
	var input_vector = Vector2.ZERO

	# Handle keyboard input (WASD or arrow keys)
	if Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_UP):
		input_vector.y -= 1
		anim_player.play("walking_up")
	elif Input.is_key_pressed(KEY_S) or Input.is_key_pressed(KEY_DOWN):
		input_vector.y += 1
		anim_player.play("walking_down")
	elif Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_LEFT):
		input_vector.x -= 1
		anim_player.play("walking_left")
	elif Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_RIGHT):
		input_vector.x += 1
		anim_player.play("walking_right")    
	else:
		# Stop the animation if no movement
		anim_player.stop()
		
	# Handle controller input (left analog stick)
	input_vector.x += Input.get_joy_axis(0, JOY_AXIS_LEFT_X)
	input_vector.y += Input.get_joy_axis(0, JOY_AXIS_LEFT_Y)

	# Normalize diagonal movement (optional) 
	if input_vector.length() > 1:
		input_vector = input_vector.normalized()

	# Move the player based on the input
	$Sprite2D.position += input_vector * speed * delta
