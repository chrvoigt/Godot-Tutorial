extends Node2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	print ('Trap caught  ..  ', body.name)  
	if body.name == 'Sprouty': 
		body.scale *= Vector2(0.9, 0.9) #wiederholtes schrumpfen um jeweils 10%
		# body.scale = Vector2(0.7, 0.7) #einmaliges schrumpfen auf 70% 
