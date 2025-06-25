

extends AnimatedSprite2D

func _process(delta: float) -> void:
	# Just to test it
	#$AnimationPlayer.play("random_sides")
	if animation_finished:
		$AnimationPlayer.play('random_sides')

func random_frame() -> void:
	frame = randi() % 6
	print (frame)	
	
	#
	## Don't want to linger on one side
	#var last_frame = frame
	#while frame == last_frame:
		#frame = randi() % sprite_frames.get_frame_count("dice_roll") # Or just 'randi() % 6'
		#print (frame)
		#get_tree().create_timer(2.0).timeout

		
