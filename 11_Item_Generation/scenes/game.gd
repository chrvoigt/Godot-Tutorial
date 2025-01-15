extends Node2D

func _ready() -> void:
	# Set the window size
	DisplayServer.window_set_size(Vector2(2260, 1240))
	# Optional: Positioning the game window (default is centered) 
	DisplayServer.window_set_position(Vector2i(500, -500)) 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
