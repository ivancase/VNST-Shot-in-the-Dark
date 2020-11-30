extends "res://scripts/Actor.gd"

var box

func _ready():
	box = body.get_node("box")
	
	body.connect("mouse_entered", self, "_on_mouse_enter")
	body.connect("mouse_exited", self, "_on_mouse_exit")
	
func _on_mouse_enter():
	if !shootable:
		return
	
	box.color = Color("c8be4a2f")
	get_parent().target = self
	
	print("mouse_enter")
	

func _on_mouse_exit():
	if !shootable:
		return
	
	box.color = Color("c8000000")
	get_parent().target = null


func _onready():
	text = body.get_node("text")
		
	exit_limelight()

func enter_limelight():
	show()
	
func exit_limelight():
	hide()
