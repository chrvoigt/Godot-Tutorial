extends Area2D
@onready var ghost = $"../Ghost"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print ('scene b') 
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: CharacterBody2D) -> void:
	print (body.name)  # Replace with function body.
	ghost.queue_free()
	get_tree().change_scene_to_file("res://scene_c.tscn")
		
