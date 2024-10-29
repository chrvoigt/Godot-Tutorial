extends CharacterBody2D
 
# Player movement speed in Pixel 
@export var speed = 200

	
func _physics_process(delta):
	handle_movement(delta)

func handle_movement(delta):
	#var input_vector = Vector2.ZERO
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	velocity = direction * speed
	
	move_and_slide()
	
	 
	 
