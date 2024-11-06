extends Node2D

@export var path = "res://assets/zapsplat_drumms.mp3"
@export var music := Dialogic.Audio.current_music_player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.start('dialog_branch_1') 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Dialogic.VAR.response == "x":
		print (Dialogic.VAR.response)
		stop_music()
		
func stop_music(): 
	music.stop()
	
	 
	
	
	pass
	
