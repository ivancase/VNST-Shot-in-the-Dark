extends Node2D

export(String, FILE, "*.tscn,*.scn") var next_scene
export(Color, RGB) var textcolor
export(bool) var is_right_aligned
export(bool) var shootable = true

onready var body = get_node("body")
onready var text_box = get_node("../Text Box")
onready var voice = get_node("voice")
onready var timer = get_node("../Timer")
onready var tween = get_node("../Tween")
onready var white_screen = get_node("../White Screen")

var anim
var text
var hiding

func _ready():
	_onready()

func _onready():
	text = text_box.get_node("text")
	anim = body.get_node("anim")
	body.connect("mouse_entered", self, "_on_mouse_enter")
	body.connect("mouse_exited", self, "_on_mouse_exit")
		
	exit_limelight()
	
func _on_mouse_enter():
	if !shootable:
		return
		
	if hiding:
		anim.modulate = Color(1, 1, 1)
		anim.playing = true
	anim.get_material().set_shader_param("enabled", true)
	get_parent().target = self
	

func _on_mouse_exit():
	if hiding:
		anim.modulate = Color(0, 0, 0)
		anim.playing = false
	anim.get_material().set_shader_param("enabled", false)
	get_parent().target = null
	
func act(line):
	if is_right_aligned:
		text.bbcode_text = "[right][color=#{hexcode}]{line}[/color][/right]".format({"hexcode": textcolor.to_html(), "line": line})
	else:
		text.bbcode_text = "[color=#{hexcode}]{line}[/color]".format({"hexcode": textcolor.to_html(), "line": line})
	
	text.percent_visible = 0
	for letter in line:
		text.percent_visible += 1.0 / len(line)
		if letter != " ":
			voice.play()
			timer.start()
			yield(timer, "timeout")
	text.percent_visible = 1

func die():
	exit_limelight()
	#anim.modulate = Color(10, 10, 10)
	hiding = false
	
	tween.interpolate_property(body, "rect_position", body.rect_position, body.rect_position + Vector2(0, 600), 1, Tween.TRANS_LINEAR)
	tween.start()
	yield(tween, "tween_completed")
		
	get_tree().change_scene(next_scene)

func enter_limelight():
	if anim:
		text_box.show()
		anim.modulate = Color(1, 1, 1)
		anim.playing = true
		hiding = false
	
func exit_limelight():
	if anim:
		text_box.hide()
		anim.modulate = Color(0, 0, 0)
		anim.playing = false
		hiding = true
