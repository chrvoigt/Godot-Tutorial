extends Node

func change_to_level(id: int) -> void:
	var path := "res://scenes/Level_%d.tscn" % id
	var err  := get_tree().change_scene_to_file(path)
	if err != OK:
		push_error("Level-Datei fehlt: " + path)
