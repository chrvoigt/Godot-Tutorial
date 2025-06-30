extends Node2D

var speed:int =200

func _ready() -> void:
	pass# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed * delta


func _on_area_2d_body_entered(body: Node2D) -> void:
	GlobalScore.score =0 
	get_tree().call_deferred ("reload_current_scene")
	 # Replace with function body.


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	GlobalScore.score +=1
	print(GlobalScore.score) # Replace with function body.
