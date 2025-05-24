extends VBoxContainer

func _on_button_1_pressed() -> void:
	print ('button1 pressed' ) 
	get_tree().change_scene_to_file("res://main.tscn")

func _on_button_2_pressed() -> void:
	var url = "https://github.com/chrvoigt/Godot-Tutorial/tree/main"
	OS.shell_open(url)
	
func _on_button_3_pressed() -> void:
	get_tree().quit()
