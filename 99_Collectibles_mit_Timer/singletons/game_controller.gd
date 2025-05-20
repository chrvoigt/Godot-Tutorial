extends Node

var total_flames: int = 0

func flame_collected(value:int):
	total_flames += value
	EventController.emit_signal("flame_collected",total_flames)
