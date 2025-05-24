extends Node2D

func _on_exit_area_body_entered(body: Node2D) -> void:
	print ('L2 mastered')  
	LevelManager.change_to_level(3) # Replace with function body.
