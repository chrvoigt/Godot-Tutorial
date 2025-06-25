extends CharacterBody2D

#@onready var sprite_2d: Sprite2D = $Sprite2D
#@export var img_scale: Vector2 = Vector2(1,1) 

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var timer: Timer = $Timer


var is_walking: bool = false
var start_time:String

func _ready() -> void:
	Signals.flower_entered.connect(_on_flower_entered)
	
func _on_flower_entered():
	if timer.time_left == 0:
		timer.start()
		start_time = Time.get_datetime_string_from_system()
		print ('Buff Start:', start_time)
	
func _physics_process(_delta: float) -> void:
	var input_vector := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	# Tastaturinput vorhanden? (ja / nein) 
	if input_vector != Vector2.ZERO:
		if is_walking == false:
			is_walking = true
			audio_player.pitch_scale = 1.5 * PlayerStats.speed/100
			audio_player.play()
		# Optionale Normierung für gleichmäßige Geschwindigkeit in Diagonalen
		input_vector = input_vector.normalized()
		velocity = input_vector * PlayerStats.speed
		# 1. Abfrage: bewegt sich Player primär auf der x oder y Achse? 
		if abs(input_vector.x) > abs(input_vector.y):
			# 2. Abfrage: nach rechts oder links 
			if input_vector.x > 0:
				animation_player.play("right")
			else:
				animation_player.play("left")
		else:
			if input_vector.y > 0:
				animation_player.play("down")
			else:
				animation_player.play("up")
	else:
		# Abbremsen bei keiner Eingabe (Bremsfaktor 0.05 kann geänedrt werden) 
		velocity.x = move_toward(velocity.x, 0, PlayerStats.speed*0.15)
		velocity.y = move_toward(velocity.y, 0, PlayerStats.speed*0.15)
	if velocity == Vector2.ZERO: 
		animation_player.play("idle")
		is_walking = false
		audio_player.stop()
		
	#print (velocity.x,'  ', velocity.y)
	move_and_slide()


func _on_timer_timeout() -> void:
	PlayerStats.speed = 100
	var end_time = Time.get_datetime_string_from_system()
	print ('Buff End: ', end_time)
