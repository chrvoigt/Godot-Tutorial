extends CharacterBody2D

const WINDOW_SIZE = Vector2(1130, 620) # Define the movement boundary
const friction = 50 # Werte: 250, 100, 1000 (versuche accel = 1000 und frciction = 100)
	
var input: Vector2 = Vector2.ZERO
var acceleration = 350
var maxspeed = 350


func _ready() -> void:
	EventController.connect("got_boosted", on_event_got_boosted_speed)
	EventController.connect("got_damaged", on_event_got_damaged_speed)
	EventController.connect("fallen_down", on_event_fallen_down_speed)
	 
	
func on_event_got_boosted_speed():
	acceleration += 100
	maxspeed += 100
	EventController.emit_signal("speed_changed", acceleration)
	
	
func on_event_got_damaged_speed():
	if maxspeed >= 150:
		maxspeed -= 100
		acceleration -= 100
	EventController.emit_signal("speed_changed", acceleration)
	
	
func on_event_fallen_down_speed():
	if maxspeed >= 150:
		maxspeed -= 100
		acceleration -= 100
	EventController.emit_signal("speed_changed", acceleration)
	

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
	player_animation(velocity)
	move_and_slide() 
	var collision_count = get_slide_collision_count()
	if collision_count: 
		print('count: ', collision_count ) 
	global_position.x = clamp(global_position.x, 0, WINDOW_SIZE.x)
	global_position.y = clamp(global_position.y, 0, WINDOW_SIZE.y)
	
	
func player_animation(direction: Vector2):
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
		$AnimationPlayer.play("down")


func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	var parent_node = area.get_parent()
	if parent_node.is_in_group("damage"):
		EventController.emit_signal("got_damaged")
		parent_node.queue_free()
	elif parent_node.is_in_group("holes"):
		EventController.emit_signal("fallen_down")
	elif parent_node.is_in_group("boost"):
		EventController.emit_signal("got_boosted")
		parent_node.queue_free()
		

 
