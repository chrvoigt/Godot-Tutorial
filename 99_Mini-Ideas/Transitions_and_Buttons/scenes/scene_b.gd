extends Area2D
@onready var ghost = $"../Ghost"

func _on_body_entered(body: CharacterBody2D) -> void:
	print (body.name)  # Replace with function body.
	ghost.queue_free()
	get_tree().change_scene_to_file("res://scene_c.tscn")
		
