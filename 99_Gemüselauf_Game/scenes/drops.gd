extends Node2D


var packed_scene =  [
	preload ("res://scenes/drops/bomb.tscn"),
	preload("res://scenes/drops/hole.tscn"),
	preload("res://scenes/drops/vegies.tscn"),
	preload("res://scenes/drops/fruits.tscn")
]

var location = Vector2()
var drop_counter:int = 0 
const MAX_DROPS: int = 150

const WINDOW_SIZE = Vector2 (1130, 620)


func _ready() -> void:
	#randomize() #randomisiert den Seed für die Generierung von Zufallszahlen 
	var rnd = RandomNumberGenerator.new()
	rnd.seed = String ("random_string_").hash()
	print('First random number ', rnd.randi())
	print('Second random number ', rnd.randi())
	for drop_counter in range (MAX_DROPS):
		var x = randi() % packed_scene.size()  
		# modulo; Rest einer Division, Ergebnis liegt immer im Bereich von 0 bis packed_scene.size() - 1
		var scene = packed_scene[x].instantiate() 
		# erzeugt vollkommen unabhängigen Szenenbaum auf Grundlage der geladenen Szene 
		scene.name = 'drop' + str(drop_counter)
		location.x = randi_range(50, WINDOW_SIZE.x-80)
		location.y = randi_range(50, WINDOW_SIZE.y-80)
		scene.position = location
		if x==0: #bomb
			var sprite = scene.get_node("Sprite2D")  
			sprite.rotation = randi_range(-60, 60) 
		if x == 1: 
			scene.add_to_group ('holes')
		elif x == 0:
			scene.add_to_group('damage')
		else: #fruit or vegie  
			scene.add_to_group ('boost') 
		print (location)
		add_child(scene)
		
		
#func _process(delta: float) -> void:
	#randomize() #randomisiert den Seed für die Generierung von Zufallszahlen 
	#
	##if drop_counter <= MAX_DROPS:
	#for drop_counter in range (MAX_DROPS):
		#var x = randi() % packed_scene.size()  
		#var scene = packed_scene[x].instantiate()
		#
		#scene.name = 'drop' + str(drop_counter)
		#location.x = randi_range(50, WINDOW_SIZE.x-70)
		#location.y = randi_range(50, WINDOW_SIZE.y-70)
		#scene.position = location
		#if x==0:  # if 'bomb' Access the Sprite2D  and modify its rotation
			#var sprite = scene.get_node("Sprite2D")  # Adjust path if needed
			#sprite.rotation = randi_range(-60, 60) 
		#
		#if x == 1: 
			#scene.add_to_group ('holes')
		#elif x == 0:
			#scene.add_to_group('damage')
		#else: #it's a fruit or vegie item 
			#scene.add_to_group ('boost') 
			#
		#print (location)
		#add_child(scene)
		#
		##drop_counter += 1
	
	
	
