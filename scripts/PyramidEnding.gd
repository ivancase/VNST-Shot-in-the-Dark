extends "res://scripts/EndingSystem.gd"

onready var pyramid = get_node("Pyramid")

func end():
	if Global.all_convicted():
		pyramid.next_scene = "res://scenes/Finale.tscn"
	else:
		pyramid.next_scene = "res://scenes/Restart.tscn"

func _ready():
	Global.PYRAMID_CONVICTED = true
	
	key = {"n" : narrator, "p" : pyramid}
	direct_scene(parse_script(SPEECH), null)
	
func make_shootable():
	pyramid.shootable = true
	if pyramid.mouse_over:
		pyramid._on_mouse_enter()

const SPEECH = """
 	p :: test !!
	"""
