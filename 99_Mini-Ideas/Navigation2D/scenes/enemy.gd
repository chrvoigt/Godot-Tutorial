extends CharacterBody2D

@export var speed := 600.0

@export var target: Node2D
var direction 
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D

func _physics_process(delta: float) -> void:
	direction = Vector2.ZERO
	
	direction = navigation_agent_2d.get_next_path_position() - global_position
	direction = direction.normalized()
	velocity = velocity.lerp( direction * speed, delta)
	
	move_and_slide() 
	
	


func _on_nav_timer_timeout() -> void:
	navigation_agent_2d.target_position = target.global_position 
