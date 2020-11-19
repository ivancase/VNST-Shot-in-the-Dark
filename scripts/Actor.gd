extends Node2D

export(Color, RGB) var textcolor

onready var body = get_node("body")
onready var nonbody = get_node("nonbody")
onready var text = nonbody.get_node("text")
onready var voice = nonbody.get_node("voice")
onready var timer = get_node("../Timer")
onready var area2D = get_node("Area2D")
var anim

var hiding

func _ready():
	if body:
		anim = body.get_node("anim")
		body.connect("mouse_entered", self, "_on_mouse_enter")
		body.connect("mouse_exited", self, "_on_mouse_exit")
		
	exit_limelight()
	
func _on_mouse_enter():
	if hiding:
		anim.modulate = Color(1, 1, 1)
		anim.playing = true
	anim.get_material().set_shader_param("enabled", true)
	

func _on_mouse_exit():
	if hiding:
		anim.modulate = Color(0, 0, 0)
		anim.playing = false
	anim.get_material().set_shader_param("enabled", false)
	
func act(line):
	text.bbcode_text = "[color=#{hexcode}]{line}[/color]".format({"hexcode": textcolor.to_html(), "line": line})
	text.percent_visible = 0
	for letter in line:
		text.percent_visible += 1.0 / len(line)
		if letter != " ":
			voice.play()
			timer.start()
			yield(timer, "timeout")
	text.percent_visible = 1

func enter_limelight():
	nonbody.show()
	if anim:
		anim.modulate = Color(1, 1, 1)
		anim.playing = true
		hiding = false
	
func exit_limelight():
	nonbody.hide()
	if anim:
		anim.modulate = Color(0, 0, 0)
		anim.playing = false
		hiding = true
