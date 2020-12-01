extends "res://scripts/Actor.gd"

export(int) var time
#var hiding

func _onready():
	hiding = true
	hide()
	body.connect("mouse_entered", self, "_on_mouse_enter")
	body.connect("mouse_exited", self, "_on_mouse_exit")
	set_time(time)
	
func _on_mouse_enter():
	mouse_over = true
	if shootable:
		body.get_material().set_shader_param("enabled", true)
		get_parent().target = self
	

func _on_mouse_exit():
	mouse_over = false
	if shootable:
		body.get_material().set_shader_param("enabled", false)
		get_parent().target = null
		
func set_time(index):
	body.texture = load("res://sprites/clock%s.png" % index)
	if !hiding and time != index:
		voice.play()
		
func die():
	mouse_over = false
	shootable = false
	
	voice.play()
	
	tween.interpolate_property(body, "rect_position", body.rect_position, body.rect_position + Vector2(0, 800), 1, Tween.TRANS_LINEAR)
	tween.start()
	yield(tween, "tween_completed")
	
	get_tree().change_scene(next_scene)

func act(line):
	print(line)
	voice.play()
	timer.start()
	yield(timer, "timeout")
	
func enter_limelight():
	hiding = false
	show()

func exit_limelight():
	pass
