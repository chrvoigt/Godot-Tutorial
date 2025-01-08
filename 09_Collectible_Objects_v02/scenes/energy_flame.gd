extends Node2D

@export var value: int = 1  # Wert einer Energieflame, später anpassbar 

func _on_area_2d_body_entered(body: Node2D) -> void:
	GameController.flame_collected(value) 
	self.queue_free() 
