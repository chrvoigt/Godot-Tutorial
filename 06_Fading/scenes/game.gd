extends Node
@onready var level_root: Node2D = $Vorspann #active
@onready var fader: Sprite2D = $"CanvasLayer/Sprite2D"


@export var fade_time: float       = 2          # seconds

const LEVELS := {
	1: preload("res://scenes/wuerfel.tscn"),
	#2: preload("res://scenes/Level_2.tscn"),
	#3: preload("res://scenes/Level_3.tscn"),
}

func change_to_level(id: int) -> void:
	var packed_scene := LEVELS.get(id) as PackedScene
	if not packed_scene:
		push_error("Unbekannte Level-ID: %d" % id)
		return
	# Run the coroutine (async) so calling code doesn't block.
	fade_and_swap(packed_scene)

func fade_and_swap(packed: PackedScene) -> void:
	# 1. Fade to black
	var tween := create_tween()
	tween.tween_property(fader, "modulate:a", 0.8, fade_time)
	await tween.finished

	# 2. Remove previous level
	for child in level_root.get_children():
		child.queue_free()

	# 3. Add the new level
	var new_level := packed.instantiate()
	level_root.add_child(new_level)

	# 4. Fade back in
	tween = create_tween()
	tween.tween_property(fader, "modulate:a", 0.0, fade_time)
	# No await needed unless more logic follows

func _ready() -> void:
	change_to_level(1)
