extends Control

export(Color, RGB) var textcolor

var text
var body
var voice
var tween

var speaking

func _ready():
	text = get_node("text")
	body = get_node("body")
	voice = get_node("voice")
	tween = get_node("../Tween")

func act(line):
	speaking = true
	
	text.bbcode_text = "[color=#{hexcode}]{line}[/color]".format({"hexcode": textcolor.to_html(), "line": line})
	voice.play()
	
	text.percent_visible = 0
	tween.interpolate_property(text, "percent_visible", 0, 1, 1,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	tween.start()
	
	voice.stop()
	
	speaking = false
