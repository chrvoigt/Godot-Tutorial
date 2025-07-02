extends CharacterBody2D


const SPEED = 300.0
var DASH_SPEED = 3
var is_dashing = false

@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var dash_particles: CPUParticles2D = $DashParticles

func _ready() -> void:
	$DashTimer.connect("timeout", stop_dash)

func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	
	var direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
		).normalized()
	
	#var direction.x = direction [0]
	#var direction.y = direction [1]
	
	if direction.x > 0:
		anim_player.play("walking_right")
		dash_particles.gravity.x = -2000
	elif direction.x < 0:
		anim_player.play("walking_left")
		dash_particles.gravity.x = 2000
	elif direction.y > 0:
		anim_player.play("walking_down")
		dash_particles.gravity.y = -2000
	elif direction.y < 0:
		anim_player.play("walking_up")	
		dash_particles.gravity.y = 2000
	else:
		anim_player.stop()
	
	if direction:
		if is_dashing:
			velocity.x = direction.x * SPEED * DASH_SPEED
			velocity.y = direction.y * SPEED * DASH_SPEED
		else: 
			velocity.x = direction.x * SPEED
			velocity.y = direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		dash_particles.gravity.x = move_toward(dash_particles.gravity.x, 0, 2000)
		dash_particles.gravity.y = move_toward(dash_particles.gravity.y, 0, 2000)
		
	# Handling dash.
	if Input.is_action_just_pressed("dash"):
		if !is_dashing and direction:
			start_dash()
	move_and_slide()

func start_dash():
	is_dashing = true
	$DashTimer.start()
	dash_particles.emitting = true
	
func stop_dash():
	is_dashing = false
	dash_particles.emitting = false
	
	
	
