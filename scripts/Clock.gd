extends Control

onready var body = get_node("body")
onready var ticksound = get_node("ticksound")
onready var timer = get_node("../Timer")

var shootable

func _ready():
	body.connect("mouse_entered", self, "_on_mouse_enter")
	body.connect("mouse_exited", self, "_on_mouse_exit")
	
func _on_mouse_enter():
	if shootable:
		body.get_material().set_shader_param("enabled", true)
		get_parent().target = self
	

func _on_mouse_exit():
	if shootable:
		body.get_material().set_shader_param("enabled", false)
		get_parent().target = null
		
func act(line):
	print(line)
	ticksound.play()
	timer.start()
	yield(timer, "timeout")

	
func die():
	get_tree().change_scene("res://scenes/SphereIcosa.tscn")
	
func enter_limelight():
	show()

func exit_limelight():
	pass
