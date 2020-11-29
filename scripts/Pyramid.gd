extends "res://scripts/Actor.gd"

var sprite

func _onready():
	sprite = body.get_node("sprite")
	anim = body.get_node("anim")
	
	text = text_box.get_node("text")
	body.connect("mouse_entered", self, "_on_mouse_enter")
	body.connect("mouse_exited", self, "_on_mouse_exit")
		
	anim.play("Pyramid")
	exit_limelight()
	
func _on_mouse_enter():
	if hiding:
		sprite.modulate = Color(1, 1, 1)
	sprite.get_material().set_shader_param("enabled", true)
	get_parent().target = self
	

func _on_mouse_exit():
	if hiding:
		sprite.modulate = Color(0, 0, 0)
	sprite.get_material().set_shader_param("enabled", false)
	get_parent().target = null

func enter_limelight():
	text_box.show()
	sprite.modulate = Color(1, 1, 1)
	hiding = false
	
func exit_limelight():
	text_box.hide()
	sprite.modulate = Color(0, 0, 0)
	hiding = true
