extends Area2D
 
var scene_c = preload("res://scene_c.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if  is_connected("body_entered", _on_body_entered):
		print ('Signal Connected')
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: CharacterBody2D) -> void:
	print (body.name)  # Replace with function body.
	get_tree().change_scene_to_packed(scene_c)
