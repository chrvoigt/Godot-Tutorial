extends Node2D

@onready var pfade: TileMapLayer = $Pfade 
@onready var rand: TileMapLayer = $Rand


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventController.connect("met_eye", on_event_met_flower)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_event_met_flower(): 
	print ("signal angekommen")
	pfade.visible = !pfade.visible
	rand.visible = !rand.visible
	rand.collision_enabled =!rand.collision_enabled
