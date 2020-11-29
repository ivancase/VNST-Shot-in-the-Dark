extends AudioStreamPlayer


func play(from_position = 0.0):
	for i in range(3):
		var original_pitch = pitch_scale
		pitch_scale *= randf() 
		.play()
		pitch_scale = original_pitch
