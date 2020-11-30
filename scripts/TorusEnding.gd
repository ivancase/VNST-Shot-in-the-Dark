extends "res://scripts/EndingSystem.gd"

onready var torus = get_node("Set of Toruses")

func _ready():
	Global.TORUS_CONVICTED = true
	
	key = {"n" : narrator, "t" : torus}
	direct_scene(parse_script(SPEECH), null)

const SPEECH = """
 	t :: test !!
	"""
