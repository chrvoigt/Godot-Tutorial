extends Node2D
@onready var ghost: Node2D = $Ghost

# ... this would be the function tah worls without using 'Signals' 

#func _physics_process(delta: float) -> void:
	#if overlaps_body(ghost):
		#print ('overlapped')
		##ghost.queue_free()
		##get_tree().change_scene_to_file("res://scene_b.tscn")


func _on_body_entered(body: CharacterBody2D) -> void:
	print (body.name)  # Replace with function body.
	ghost.queue_free()
	get_tree().change_scene_to_file("res://scene_b.tscn")
