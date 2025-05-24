extends Node2D

func _on_exit_area_body_entered(body: Node2D) -> void:
	print ('L1 mastered')  
	LevelManager.change_to_level(2)
	
	
