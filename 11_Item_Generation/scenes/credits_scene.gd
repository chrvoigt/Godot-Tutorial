extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween().set_parallel()
	tween.tween_property($VBoxContainer, "position", Vector2(-1000, -1240), 6)
	tween.tween_property($VBoxContainer, "rotation_degrees", 90, 6)
 
