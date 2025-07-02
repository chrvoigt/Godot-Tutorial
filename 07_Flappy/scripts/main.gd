extends Node2D

@onready var tubes: PackedScene = preload("res://scenes/tubes.tscn")
@onready var label: Label = $CanvasLayer/Control/Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = str(GlobalScore.score)
	# Durchlaufe alle Kinder
	for child in get_children():
		# Prüfe, ob es ein Tube-Node ist (z.B. per Klasse oder Group)
		if child is Node2D and child.name.begins_with("Tube"): 
			# Optional: besser ein Group-System nutzen, siehe unten
			if child.position.x < -100: # links weit genug raus
				print (child.name)
				child.queue_free()


func _on_timer_timeout() -> void:
	var tubeInstance = tubes.instantiate()
	tubeInstance.position.x = 1151
	tubeInstance.position.y = randi_range(50,200)
	
	add_child(tubeInstance)
	$Timer.start()
# Replace with function body.
 
