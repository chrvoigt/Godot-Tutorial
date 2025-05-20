extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause_game"):
		toggle_pause()
	
func toggle_pause(): 
	print ('break')
	EventController.emit_signal("game_break")
