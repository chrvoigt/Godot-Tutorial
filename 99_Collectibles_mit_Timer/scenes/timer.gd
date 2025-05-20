extends Node2D

# Variable to store elapsed time
var elapsed_time: int = 115
var pause: bool = false

func _ready():
	# Start the timer (assuming it's named "Timer")
	$TimeCounter.wait_time = 1.0  # Set the timer interval to 1 second
	$TimeCounter.autostart = true  # Start the timer automatically
	$TimeCounter.start()
	# Connect the timer's timeout signal
	$TimeCounter.timeout.connect(_on_time_counter_timeout)
	EventController.connect("game_break", on_event_game_break)
	# Option 3: Signal.connect() with an implicit Callable for the defined function.
	# button.button_down.connect(_on_button_down)

func on_event_game_break():
	pause = !pause
	if pause:
		$TimeCounter.stop()
	else:
		$TimeCounter.start()

func _on_time_counter_timeout() -> void:
	# Increment the elapsed time every second
	elapsed_time += 1
	print("Elapsed time: ", elapsed_time)
	$Label.text = format_time (elapsed_time)


func format_time(elapsed_time: int) -> String:
	var minutes = elapsed_time / 60  # ganzzahlige Division 
	var seconds = elapsed_time % 60  # Rest per Modulorechnung   
	return str("%02d" %  minutes) + ":" + str("%02d" % seconds) #.pad_left(2, "0")
	
	# print(format_string % [7, 3, 8.8888])
	

	
