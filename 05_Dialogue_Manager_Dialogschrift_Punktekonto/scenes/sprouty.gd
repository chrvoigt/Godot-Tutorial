extends CharacterBody2D

#@onready var sprite_2d: Sprite2D = $Sprite2D
#@export var img_scale: Vector2 = Vector2(1,1) 

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var actionable_finder: Area2D = $ActionableFinder


@export var speed: float = 100
var dialogue_active: bool = false

func _ready() -> void:
	DialogueManager.connect("dialogue_ended", on_dialogue_ended) 
	
func on_dialogue_ended(dialogue_ressource):
	print ('end', dialogue_ressource)
	dialogue_active = false 
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size()>0: 
			actionables[0].action()  #actionables[0] bezieht sich auf das erste Area2D auf Layer 5 
			dialogue_active = true

#func _unhandled_input(event):
	#if event.is_action_pressed("ui_accept"):
		#DialogueManager.show_dialogue_balloon (preload("res://dialogue/versuchung.dialogue"), "buch") 


func _physics_process(_delta: float) -> void:
	# Dialog aktiv? (ja / nein) 
	if !dialogue_active:
		# Tastaturinput vorhanden? (ja / nein) 
		var input_vector := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		if input_vector != Vector2.ZERO:
			# Optionale Normierung für gleichmäßige Geschwindigkeit in Diagonalen
			input_vector = input_vector.normalized()
# +++++ PlayerStats
			velocity = input_vector * speed * PlayerStats.energy
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
			velocity.x = move_toward(velocity.x, 0, speed*0.15)
			velocity.y = move_toward(velocity.y, 0, speed*0.15)
		if velocity == Vector2.ZERO: 
			animation_player.play("idle")
		#print (velocity.x,'  ', velocity.y)
		move_and_slide()
	

		
