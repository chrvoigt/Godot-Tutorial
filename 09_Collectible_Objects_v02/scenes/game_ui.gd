extends Control
@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	EventController.connect("flame_collected", on_event_flame_collected)
	EventController.connect("game_break", on_event_game_break)
	$Pause.visible = false
	# print (EventController.is_connected("flame_collected", on_event_flame_collected))
	
func on_event_flame_collected(value:int):
	label.text = str(value) 
	print ('Label:',label.text)
	
func on_event_game_break():
	$Pause.visible = !$Pause.visible
	
