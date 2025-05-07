extends Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $StaticBody2D/CollisionShape2D
@export var collision_shape_scale: Vector2 = Vector2(2,2)  


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision_shape_2d.scale = collision_shape_scale
