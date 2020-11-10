extends Control

var dialogue_index = 0
var currently_talking = false

var rightname = null
var leftname = null
var body = null
var tween = null
var sprite = null
var talksound = null


func _ready():
	rightname = get_node("rightname")
	leftname = get_node("leftname")
	body = get_node("body")
	tween = get_node("Tween")
	_load_dialog()
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") && !currently_talking:
		_load_dialog()

func _load_dialog():
	_switch_names(dialogue_index % 2)
	currently_talking = true
	if sprite:
		sprite.hide()
	sprite = null
	body.bbcode_text = "\n"
	match dialogue_index:
		0:
			sprite = get_node("icosahedron")
			body.bbcode_text += "this is a test !!"
		1:
			sprite = get_node("sphere")
			body.bbcode_text += "Yes. Quite an interesting test, indeed."
		2:
			sprite = get_node("icosahedron")
			get_tree().change_scene("res://scenes/scene1.tscn")
			return
	talksound.play()
	sprite.show()
	sprite.playing = true
	body.percent_visible = 0
	tween.interpolate_property(body, "percent_visible", 0, 1, 1,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	tween.start()
	
	dialogue_index += 1
	currently_talking = false
	
func _switch_names(index):
	if index == 0:
		rightname.show()
		leftname.hide()
		talksound = get_node("clerktalk")
	else:
		leftname.show()
		rightname.hide()
		talksound = get_node("gamertalk")
