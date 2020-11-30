extends "res://scripts/EndingSystem.gd"

onready var pyramid = get_node("Pyramid")

func _ready():
	Global.PYRAMID_CONVICTED = true
	
	key = {"n" : narrator, "p" : pyramid}
	direct_scene(parse_script(SPEECH), null)

const SPEECH = """
 	p :: test !!
	"""
