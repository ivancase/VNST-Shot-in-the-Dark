extends "res://scripts/EndingSystem.gd"

onready var icosahedron = get_node("Icosahedron")

func end():
	if Global.all_convicted():
		icosahedron.next_scene = "res://scenes/Finale.tscn"
	else:
		icosahedron.next_scene = "res://scenes/Restart.tscn"

func _ready():
	Global.ICOSAHEDRON_CONVICTED = true
	
	key = {"n" : narrator, "i" : icosahedron}
	direct_scene(parse_script(SPEECH), null)
	
func make_shootable():
	icosahedron.shootable = true
	if icosahedron.mouse_over:
		icosahedron._on_mouse_enter()

const SPEECH = """
 	i :: test !!
	"""
