extends "res://scripts/EndingSystem.gd"

onready var icosahedron = get_node("Icosahedron")

func _ready():
	Global.ICOSAHEDRON_CONVICTED = true
	
	key = {"n" : narrator, "i" : icosahedron}
	direct_scene(parse_script(SPEECH), null)

const SPEECH = """
 	i :: test !!
	"""
