extends Control

#players inventory laden 
@onready var inv:Inv = preload("res://inventory/playerinv.tres") 
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var is_open = false

func update_slots():
	for i in range (inv.items.size()):      
		slots[i].update(inv.items[i])
# making sure inentory is closed 
func _ready(): 
	#inv.update.connect(update_slots) # signal - function verknüpfung 
	#print ('test', inv.items.size(), ' ',slots.size())
	update_slots()
	close() 

#size = number of elements in the array.

		
		

	
#func update_slots():
	#for i in range ( min ( inv.slots.size(), slots.size() ) ):      #size = number of elements in the array.
		#slots[i].update(inv.slots[i])
	
# implementing button to open and close inventory 
func _process(delta): 
	if Input.is_action_just_pressed("i"):
		if is_open:
			close()
		else: 
			open() 
			 

func open():
	visible = true
	is_open = true
	
func close():
	visible = false
	is_open = false
	
	
