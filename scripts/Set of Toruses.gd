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
	
	for torus in all_toruses:
			torus.playing = true
	
	text = text_box.get_node("text")
	body.connect("mouse_entered", self, "_on_mouse_enter")
	body.connect("mouse_exited", self, "_on_mouse_exit")
		
	exit_limelight()
	
func _on_mouse_enter(toruses=all_toruses):
	mouse_over = true
	
	if !shootable:
		return
	
	if hiding:
		for torus in toruses:
			torus.modulate = Color(1, 1, 1)
			#torus.playing = true
	for torus in all_toruses:
		torus.get_material().set_shader_param("enabled", true)
	get_parent().target = self
	

func _on_mouse_exit(toruses=all_toruses):
	mouse_over = false
	
	if !shootable:
		return
	
	if hiding:
		for torus in toruses:
			torus.modulate = Color(0, 0, 0)
			#torus.playing = false
	for torus in toruses:
		torus.get_material().set_shader_param("enabled", false)
	get_parent().target = null

func enter_limelight(toruses=all_toruses):
	hiding = false
	text_box.show()
	for torus in toruses:
		torus.modulate = Color(1, 1, 1)
		#torus.playing = true
	
func exit_limelight(toruses=all_toruses):
	hiding = true
	text_box.hide()
	if !mouse_over:
		for torus in toruses:
			torus.modulate = Color(0, 0, 0)
			#torus.playing = false
