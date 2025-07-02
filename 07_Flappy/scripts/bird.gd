extends CharacterBody2D

var gravity:float = 981
@export var jumpforce: float = 400

func _physics_process(delta: float) -> void:
	velocity.y +=gravity * delta
	if Input.is_action_just_pressed("jump"):
		velocity.y =-jumpforce
	move_and_slide()
