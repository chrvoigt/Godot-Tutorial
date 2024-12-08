extends CharacterBody2D

# Werte: 250, 100, 1000 (versuche accel = 1000 und frciction = 100)
const maxspeed = 250
const acceleration = 100
const friction = 1000
	
var input: Vector2 = Vector2.ZERO
var watering: bool = false

# 'delta' bezieht sich hier auf eine *konstante* Framerate (z.B. 0.01 sec)
func _physics_process(delta: float):
	player_movement(delta)
	
# is_action_pressed ergibt (true, false) und int() wndelt es in 1 oder 0  
func get_input():
	input.x = int(Input.is_action_pressed('ui_right'))-int (Input.is_action_pressed('ui_left'))
	input.y = int(Input.is_action_pressed('ui_down'))-int (Input.is_action_pressed('ui_up'))
	return input.normalized()

func player_movement (delta):
	input = get_input()
	# keine Eingabe => Geschwindigkeit wird per 'Reibungswert' reduzieren
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta) 
		else: 
			velocity = Vector2.ZERO
	else:
	# Eingabe => Geschwindigkeit wird per 'Beschleunigung' erhöht, im Rahmen der Höchstgeschwindigkeit  
		velocity += (input * acceleration * delta)
		velocity = velocity.limit_length(maxspeed)
	
	sprouty_animation(velocity)
	move_and_slide()
		
func sprouty_animation(direction: Vector2):
	#if direction:
		#print (direction)
	if direction.y>0:
		$AnimationPlayer.play("down")
	elif direction.y<0:
		$AnimationPlayer.play("up")
	elif direction.x<0:
		$AnimationPlayer.play("left")
	elif direction.x>0:
		$AnimationPlayer.play("right")
	elif direction.x == 0 and direction.x == 0:
		if watering:
			$AnimationPlayer.play("watering")
		else:
			$AnimationPlayer.play('idle')
			
	if Input.is_action_pressed('watering'):
		watering = true
	else:
		watering = false
	print (watering)
	
