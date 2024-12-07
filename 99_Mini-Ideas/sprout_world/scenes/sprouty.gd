extends CharacterBody2D

const maxspeed = 250
const accel = 200
const friction = 2000
	
var input: Vector2 = Vector2.ZERO

func _physics_process(delta: float):
	player_movement(delta)
	
	
func get_input():
	input.x = int(Input.is_action_pressed('ui_right'))-int (Input.is_action_pressed('ui_left'))
	input.y = int(Input.is_action_pressed('ui_down'))-int (Input.is_action_pressed('ui_up'))
	return input.normalized()
	
func sprouty_animation(direction: Vector2):
	if direction:
		print (direction)
	if direction.y>0:
			$AnimationPlayer.play("down")
	elif direction.y<0:
			$AnimationPlayer.play("up")
	elif direction.x<0:
			$AnimationPlayer.play("left")
	elif direction.x>0:
			$AnimationPlayer.play("right")
	else:
		$AnimationPlayer.stop()
	
func player_movement (delta):
	input = get_input()

	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction* delta) 
		else: 
			velocity = Vector2.ZERO
	else:
		velocity += (input * accel * delta)
		velocity = velocity.limit_length(maxspeed)
	
	sprouty_animation(velocity)
	move_and_slide()
	
