extends CharacterBody2D

const SPEED = 600.0

#step 1: reference the nodes, after the scene tree is fully loaded 
@onready var dialogue: RichTextLabel = $Node2D/NinePatchRect/DialogueLabel
@onready var bubble: NinePatchRect = $Node2D/NinePatchRect
@onready var figure: Sprite2D = $Sprite2D

#steo 2: create variable with initial values 
@export var dialogue_text: String = "I'm dreaming of a white Christmas, Just like the ones I used to know ..."
@export var bubble_shape: Texture2D = preload("res://assets/bubble_shape.png")
@export var figure_texture: Texture2D = preload("res://assets/schneemann.png")

#step 3: assign initil values to nodes 
func _ready():
	dialogue.text = dialogue_text
	bubble.texture = bubble_shape
	figure.texture = figure_texture

func _physics_process(_delta):
	# Get axis input by specifying two actions, one negative and one positive. (-1; +1) 
	# As good practice, you should replace UI actions with custom gameplay actions. (to avoid confusion between handling the UI and steering the character) 
	var x_direction := Input.get_axis("left", "right")
	var y_direction := Input.get_axis("ui_up","ui_down")
	
	if x_direction:
		velocity.x = x_direction * SPEED
	elif y_direction:
		velocity.y = y_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()


func _on_timer_timeout() -> void:
	dialogue.text = "Don't you like the song?"
	figure.texture = figure_texture


func _on_timer_timeout_2() -> void:
	dialogue.text = "Shall I tell the truth"
	figure.texture = figure_texture
