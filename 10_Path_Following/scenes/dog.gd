extends PathFollow2D
var direction = 1
const EPSILON = 0.01  # Small margin for floating-point inaccuracies

@onready var dog = $Dog/AnimationPlayer # to flip the sprite horizontally

func _process(_delta: float) -> void:
	progress_ratio += 0.005 * direction
	if progress_ratio >= 1 - EPSILON:
		direction = -1
		dog.play("running_right")
	if progress_ratio <= 0 + EPSILON:
		direction = 1 
		dog.play("running_left") 
