extends Control

export(Color, RGB) var textcolor

var text
var body
var nonbody
var voice
var tween

var speaking

func _ready():
	body = get_node("body")
	nonbody = get_node("nonbody")
	text = nonbody.get_node("text")
	voice = nonbody.get_node("voice")
	tween = get_node("../Tween")
	
	nonbody.hide()

func act(line):
	text.bbcode_text = "[color=#{hexcode}]{line}[/color]".format({"hexcode": textcolor.to_html(), "line": line})
	voice.play()
	
	text.percent_visible = 0
	tween.interpolate_property(text, "percent_visible", 0, 1, 1,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	tween.start()
	
	voice.stop()

func enter_limelight():
	nonbody.show()
	if body:
		body.modulate = Color(1, 1, 1)
		body.playing = true
	
func exit_limelight():
	nonbody.hide()
	if body:
		body.modulate = Color(0, 0, 0)
		body.playing = false
