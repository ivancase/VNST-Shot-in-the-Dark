extends "res://scripts/Actor.gd"

var sprite

func _onready():
	voice.pitch_scale = 2
	sprite = body.get_node("sprite")
	anim = body.get_node("anim")
	
	text = text_box.get_node("text")
		
	anim.play("Pyramid")
	exit_limelight()
	
func _process(delta):
	var center = body.rect_position + (body.rect_size / 2)
	center.x -= 20 # fine-tuning the center, sprite isn't symmetrical
	
	if center.distance_to(get_global_mouse_position()) <= 100:
		_on_mouse_enter()
	else:
		if (get_parent().target == self):
			_on_mouse_exit()
	
func _on_mouse_enter():
	mouse_over = true
	if !shootable:
		return
	
	if hiding:
		sprite.modulate = Color(1, 1, 1)
	sprite.get_material().set_shader_param("enabled", true)
	get_parent().target = self
	

func _on_mouse_exit():
	mouse_over = false
	if !shootable:
		return
	
	if hiding:
		sprite.modulate = Color(0, 0, 0)
	sprite.get_material().set_shader_param("enabled", false)
	get_parent().target = null
	
func die():
	anim.stop()
	.die()

func enter_limelight():
	hiding = false
	text_box.show()
	sprite.modulate = Color(1, 1, 1)
	
func exit_limelight():
	hiding = true
	text_box.hide()
	if !shootable or !mouse_over:
		sprite.modulate = Color(0, 0, 0)
