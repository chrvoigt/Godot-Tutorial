extends CharacterBody2D
const SPEED = 100.0 

@onready var anim: AnimationPlayer = $AnimationPlayer


func _physics_process(delta: float) -> void:
	get_direction()
	character_anim()
	move_and_slide()
	
func get_direction():
	var direction_x := Input.get_axis("ui_left", "ui_right")
	var direction_y := Input.get_axis("ui_up", "ui_down")
	if direction_x or direction_y:
		velocity.x = direction_x * SPEED
		velocity.y = direction_y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
		
func character_anim():
	if velocity.x > 0:
		anim.play('right')
	if velocity.x < 0:
		anim.play('left')
	if velocity.y > 0:
		anim.play('down')
	if velocity.y < 0:
		anim.play('up')
	if velocity == Vector2.ZERO:
		anim.play('idle')
