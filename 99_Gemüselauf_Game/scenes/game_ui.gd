extends CanvasLayer
@onready var lives_label: Label = $PanelContainer/MarginContainer/VBoxContainer/Lives/Lives_Label
@onready var skills_label: Label = $PanelContainer/MarginContainer/VBoxContainer/Skills/Skills_Label
@onready var speed_label: Label = $PanelContainer/MarginContainer/VBoxContainer/Speed/Speed_Label


var lives: int = 10
var skills: int = 0  

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
# using a key-value dictionary 
@export var audio_files = {  
	"plop": preload("res://assets/audio/plop.mp3"),
	"hole": preload("res://assets/audio/hole.mp3"),
	"bomb": preload("res://assets/audio/bomb.mp3")
}

func _ready():
	EventController.connect("got_boosted", on_event_got_boosted)
	EventController.connect("got_damaged", on_event_got_damaged)
	EventController.connect("fallen_down", on_event_fallen_down)
	EventController.connect("speed_changed", on_event_speed_changed)
	
func on_event_got_damaged():
	lives -= 1 
	lives_label.text = str(lives)
	if lives <= 0:
		$Game_Over.visible = true
		var credits_scene = preload("res://scenes/credits_scene.tscn").instantiate()
		$Game_Over.add_child(credits_scene)
	audio_stream_player.stream =  audio_files ['bomb'] 
	audio_stream_player.play()	
	
func on_event_got_boosted():
	skills += 1
	skills_label.text = str (skills) 
	audio_stream_player.stream =  audio_files ['plop'] 
	audio_stream_player.play()
	
func on_event_fallen_down():
	lives_label.text = str(lives)
	audio_stream_player.stream =  audio_files ['hole'] 
	audio_stream_player.play()	

func on_event_speed_changed(speed):
	speed_label.text = str (speed)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
