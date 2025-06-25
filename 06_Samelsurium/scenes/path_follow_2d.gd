extends PathFollow2D

@onready var frog: AnimatedSprite2D = $AnimatedSprite2D

var prev_x: float
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	prev_x = global_position.x
	frog.flip_h = true
	
func _process(delta: float) -> void:
	
	frog.play()
	var x_diff = global_position.x - prev_x
	if x_diff < 0:
		frog.flip_h = false
	else:
		frog.flip_h = true
		
	prev_x = global_position.x
	
	progress += 0.2
	
