extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	print ('Flower met ..  ', body.name)  
	if body.name == 'Sprouty':
		body.scale = Vector2(1.5,1.5)
		self.queue_free() 
	

#@export var value: int = 1  # Wert einer Energieflame, später anpassbar 

#func _on_area_2d_body_entered(body: Node2D) -> void:
	#GameController.flame_collected(value) 
	#self.queue_free() 
