

extends CharacterBody2D

const SPEED = 600.0
const JUMP_VELOCITY = -400.0
const DECELERATION = 30.0


func _physics_process(delta):
		# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Get axis input by specifying two actions, one negative and one positive. (-1; +1) 
	# As good practice, you should replace UI actions with custom gameplay actions. (to avoid confusion between handling the UI and steering the character) 
	var x_direction := Input.get_axis("left", "right")
	# äquivalent für y_direction ? ('ui_up') 
	
	if x_direction:
		velocity.x = x_direction * SPEED

	else:
		# der Geschwindigkweitswert (velocity) wird verringert (move_towards 0) 
		velocity.x = move_toward(velocity.x, 0, DECELERATION)
		# alternativ könnten auhc beide Werte einfach auf Null gesetzt werden 
		#velocity.x = 0
		#velocity.y = 0
	move_and_slide()
