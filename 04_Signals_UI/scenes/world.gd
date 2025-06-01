extends Node2D

@onready var pfade: TileMapLayer = $Pfade 
@onready var rand: TileMapLayer = $Rand

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventController.connect("met_eye", on_event_met_eye)

func on_event_met_eye(): 
	print ("signal angekommen")
	rand.visible = !rand.visible
	rand.collision_enabled =!rand.collision_enabled
