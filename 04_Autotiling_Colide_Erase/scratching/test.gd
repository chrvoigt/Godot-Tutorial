extends Node

var a:Array = [1,2,3]

func _ready() -> void:
	var b = a # a reference to the original 
	# var b = a.duplicate() # a true copy 
	b[1]='huhu'
	print(a)
	
	
