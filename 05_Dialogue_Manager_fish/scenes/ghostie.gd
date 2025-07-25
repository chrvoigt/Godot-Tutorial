# File: player.gd
extends CharacterBody2D  

# Player movement speed in Pixel 
var speed = 150
var target_position: Vector2 

# Reference to the AnimationPlayer
@onready var anim_player = $AnimationPlayer
@onready var actionable_finder: Area2D = $ActionableFinder
#
func _process(delta):
	handle_movement(delta)

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed('ui_accept'):
		var actionables = actionable_finder.get_overlapping_areas()
		print (actionables)
		if actionables.size() > 0:
			print ('Feld Zero: ', actionables[0].dialogue_start)
			actionables [0].action()

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
	position += input_vector * speed * delta
