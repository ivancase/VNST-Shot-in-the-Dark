extends "res://scripts/EndingSystem.gd"

onready var sphere = get_node("Sphere")

func _ready():
	Global.SPHERE_CONVICTED = true
	
	key = {"n" : narrator, "s" : sphere}
	direct_scene(parse_script(SPEECH), null)

const SPEECH = """
 	s :: test !!
	"""
