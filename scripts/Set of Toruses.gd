extends "res://scripts/Actor.gd"

var top
var right
var left
var all_toruses

func _onready():
	top = body.get_node("top")
	right = body.get_node("right")
	left = body.get_node("left")
	all_toruses = [top, right, left]
	
	text = text_box.get_node("text")
	body.connect("mouse_entered", self, "_on_mouse_enter")
	body.connect("mouse_exited", self, "_on_mouse_exit")
		
	exit_limelight()
	
func _on_mouse_enter():
	if hiding:
		for torus in all_toruses:
			torus.modulate = Color(1, 1, 1)
			torus.playing = true
	for torus in all_toruses:
		torus.get_material().set_shader_param("enabled", true)
	get_parent().target = self
	

func _on_mouse_exit():
	if hiding:
		for torus in all_toruses:
			torus.modulate = Color(0, 0, 0)
			torus.playing = false
	for torus in all_toruses:
		torus.get_material().set_shader_param("enabled", false)
	get_parent().target = null

func enter_limelight():
	text_box.show()
	for torus in all_toruses:
		torus.modulate = Color(1, 1, 1)
		torus.playing = true
	hiding = false
	
func exit_limelight():
	text_box.hide()
	for torus in all_toruses:
		torus.modulate = Color(0, 0, 0)
		torus.playing = false
	hiding = true
