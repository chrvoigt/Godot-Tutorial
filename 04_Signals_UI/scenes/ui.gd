extends CanvasLayer

var flower_counter:int = 0 
var poison_counter:int = 0 
var health_bar_x:int = 10
var health_bar_max:int = 200

@onready var poison_count: Label = $VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/Poison/PoisonCount
@onready var flower_count: Label = $VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/Flower/FlowerCount
@onready var green: ColorRect = $VBoxContainer/PanelContainer/MarginContainer/VBoxContainer/PanelContainer/Green


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventController.connect("met_flower", on_event_met_flower)
	flower_count.text = str(flower_counter)
	poison_count.text = "0"
	
func on_event_met_flower():
	print('UI triggered')
	# flower counter hochsetzen 
	flower_counter += 1
	flower_count.text = str(flower_counter)
	#healthbar verlängern
	health_bar_x += health_bar_max * 0.1
	#healthbar darf in der Länge nicht den health_bar_max Wert überschreiten   
	health_bar_x = clamp(health_bar_x,0,health_bar_max)
	green.size = Vector2(health_bar_x, green.size.y)
