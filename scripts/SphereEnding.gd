extends "res://scripts/EndingSystem.gd"

onready var sphere = get_node("Sphere")

func end():
	if Global.all_convicted():
		sphere.next_scene = "res://scenes/Finale.tscn"
	else:
		sphere.next_scene = "res://scenes/Restart.tscn"

func _ready():
	Global.SPHERE_CONVICTED = true
	
	key = {"n" : narrator, "s" : sphere}
	direct_scene(parse_script(SPEECH), null)
	
func make_shootable():
	sphere.shootable = true
	if sphere.mouse_over:
		sphere._on_mouse_enter()

const SPEECH = """
 	s :: test !!
	"""
