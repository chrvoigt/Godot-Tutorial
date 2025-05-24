extends Node

var current_level: int = 1        # 1-basiert, für Leserlichkeit
var progression_points := {}       # leeres Dictionary, z.B. {"L1_Treasure": true}

func mark_progress(key: String) -> void:
	progression_points[key] = true
	print (progression_points)

func has_progress(key: String) -> bool:
	return progression_points.get(key, false) 
	# Existiert der Schlüssel key nicht wird false zurückgegeben 
	# Funktion has_progress() hat also stets einen booleschen Rückgabewert und vermeidet null-Werte.

	
