extends Node2D

var speed:int =200

func _ready() -> void:
	pass# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.x -= speed * delta

func _on_failing_body_entered(body: Node2D) -> void:
	GlobalScore.score =0 
	get_tree().call_deferred ("reload_current_scene")

func _on_scoring_body_entered(body: Node2D) -> void:
	GlobalScore.score +=1
	print(GlobalScore.score) 
