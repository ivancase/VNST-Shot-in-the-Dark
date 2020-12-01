extends "res://scripts/EndingSystem.gd"

onready var torus = get_node("Set of Toruses")

func end():
	if Global.all_convicted():
		torus.next_scene = "res://scenes/Finale.tscn"
	else:
		torus.next_scene = "res://scenes/Restart.tscn"

func _ready():
	Global.TORUS_CONVICTED = true
	
	key = {"n" : narrator, "t" : torus}
	direct_scene(parse_script(SPEECH), null)
	
func make_shootable():
	torus.shootable = true
	if torus.mouse_over:
		torus._on_mouse_enter()

const SPEECH = """
 	t :: test !!
	"""
