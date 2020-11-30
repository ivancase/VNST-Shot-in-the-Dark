extends "res://scripts/EndingSystem.gd"

onready var torus = get_node("Set of Toruses")
onready var pyramid = get_node("Pyramid")

func _ready():
	key = {"t" : torus, "p" : pyramid, "n" : narrator}
	
	direct_scene(parse_script(INTRO), null)
		
func direct_scene(intro, _scripts):
	yield(play_dialogue(intro), "completed")
	end()
		
func end():
	yield(play_dialogue(parse_script(BAD_END)), "completed")
	.end()
	
		
const INTRO = """
	t :: WAIT WHAT. I CAN DO THAT
	p :: heelll l yeah my fast brother!!!!!!
	t :: I FEEL. SO... FREE.
	"""
	
const BAD_END = """
	n :: ok. no. this is absolutely awful.
	"""
	
