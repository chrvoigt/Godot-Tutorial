extends PathFollow2D

@onready var knight = $Knight/AnimatedSprite2D
var x_pos: float = 0
var x_pos_new: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	rotates = false #property of PathFollow2D, so knight doesn't walk upside down 

	if (x_pos <= x_pos_new):  	#moving right
		knight.flip_h = false
	else:						#moving left 
		knight.flip_h = true 
		
	x_pos = knight.global_position.x
	progress_ratio += .0007
	x_pos_new = knight.global_position.x
	
	
	
	
