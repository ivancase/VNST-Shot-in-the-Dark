extends "res://scripts/DialogSystem.gd"

onready var icosa = get_node("Icosahedron")
onready var pyramid = get_node("Pyramid")
onready var narrator = get_node("Narrator")
onready var exonecute_text = get_node("Exonecute Text")
onready var color_shift = get_node("Color Shift")

func _ready():
	key = {"i" : icosa, "p" : pyramid, "n" : narrator}
	
	var choices = ["Placeholder."]
	var scripts = [PLACEHOLDER]
	assert(len(choices) == len(scripts), "Choices must correspond to a script.")
	
	choicebox.populate(choices)
	
	direct_scene(parse_script(INTRO), scripts)
		
	
func end():
	exonecute_text.show()
	color_shift.duration /= 2
	yield(play_dialogue(parse_script(TIMES_UP)), "completed")
		
const INTRO = """
 	n :: short intro test.
	p :: fastsfrastastasfastasfstas.
	i :: hello !!
	"""
	
const PLACEHOLDER = """
	n :: this is a placeholder dawg
	"""
	
const TIMES_UP = """
	n :: ok. time's up. make your choice.
	"""
	
