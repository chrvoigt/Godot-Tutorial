class_name Player extends CharacterBody2D


const SPEED = 300.0 
# Define the movement boundary
const WINDOW_SIZE = Vector2(2000, 1000)

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var x_direction := Input.get_axis("ui_left", "ui_right")
	var y_direction := Input.get_axis("ui_up", "ui_down")
	if x_direction or y_direction:
		velocity.x = x_direction * SPEED
		velocity.y = y_direction * SPEED	
	else:
		# move_toward verändert einen *beliebigen* Zahlenwert (z.B. Vector2 Position, 
		# Skalierung, Transparenzwert); here it applies deceleration to velocity
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED) 
		
	move_and_slide()
	
	global_position.x = clamp(global_position.x, 0, WINDOW_SIZE.x)
	global_position.y = clamp(global_position.y, 0, WINDOW_SIZE.y)
			
	
