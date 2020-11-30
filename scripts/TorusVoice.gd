extends AudioStreamPlayer


func play(from_position = 0.0):
	for _i in range(3):
		var original_pitch = pitch_scale
		pitch_scale *= randf() 
		.play(from_position)
		pitch_scale = original_pitch
