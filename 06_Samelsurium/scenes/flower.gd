extends Node2D
@warning_ignore("unused_parameter")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> float:
	var start_time = Time.get_unix_time_from_system()
	Signals.flower_entered.emit()
	print ('entering body was: ', body) 
	if body.name == 'Sprouty': 
		body.scale = Vector2(1.5,1.5)
		PlayerStats.speed *=1.5
	return start_time
		
