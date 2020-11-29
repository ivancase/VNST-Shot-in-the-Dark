extends "res://scripts/DialogSystem.gd"

onready var torus = get_node("Set of Toruses")
onready var pyramid = get_node("Pyramid")
onready var narrator = get_node("Narrator")
onready var exonecute_text = get_node("Exonecute Text")
onready var color_shift = get_node("Color Shift")

func _ready():
	key = {"t" : torus, "p" : pyramid, "n" : narrator}
	
	direct_scene(parse_script(INTRO), null)
		
func direct_scene(intro, _scripts):
	yield(play_dialogue(intro), "completed")
	end()
		
func end():
	pass
		
const INTRO = """
	t :: WAIT WHAT. I CAN DO THAT
	p :: heelll l yeah my fast brother!!!!!!
	n :: bad end.
	"""
	
const TIMES_UP = """
	n :: ok. time's up. make your choice.
	"""
	
