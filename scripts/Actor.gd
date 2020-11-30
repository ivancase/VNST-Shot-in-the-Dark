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
#onready var white_screen = get_node("../White Screen")

var anim
var text
var mouse_over

func _ready():
	_onready()

func _onready():
	text = text_box.get_node("text")
	anim = body.get_node("anim")
	body.connect("mouse_entered", self, "_on_mouse_enter")
	body.connect("mouse_exited", self, "_on_mouse_exit")
		
	exit_limelight()
	
func _on_mouse_enter():
	mouse_over = true
	if !shootable:
		return
		
	anim.modulate = Color(1, 1, 1)
	anim.playing = true
	anim.get_material().set_shader_param("enabled", true)
	get_parent().target = self
	

func _on_mouse_exit():
	mouse_over = false
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
	mouse_over = false
	shootable = false
	
	exit_limelight()
	#anim.modulate = Color(10, 10, 10)
	
	tween.interpolate_property(body, "rect_position", body.rect_position, body.rect_position + Vector2(0, 800), 1.5, Tween.TRANS_LINEAR)
	tween.start()
	yield(tween, "tween_completed")
		
	get_tree().change_scene(next_scene)

func enter_limelight():
	text_box.show()
	anim.modulate = Color(1, 1, 1)
	anim.playing = true
	
func exit_limelight():
	text_box.hide()
	if !mouse_over:
		anim.modulate = Color(0, 0, 0)
		anim.playing = false
