extends Control

# step 1: d_file holds the path to a .json file, export makes it editable in the Inspektor  
@export_file("*.json") var d_file

var dialogue = []
var current_dialogue_id = 0


func _ready():
	start()
	
func start():
	dialogue = load_dialogue()
	current_dialogue_id = -1
	next_line()
	
func load_dialogue():
	var file = FileAccess.open("res://dialog/dialog.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		next_line()
	
func next_line(): 
	current_dialogue_id += 1
	if current_dialogue_id >= len(dialogue):
		return 
		
	$NinePatchRect/Name.text = dialogue [current_dialogue_id]['name']
	$NinePatchRect/Text.text = dialogue [current_dialogue_id]['text']
	
	
	
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
