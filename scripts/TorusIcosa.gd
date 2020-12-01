extends "res://scripts/DialogSystem.gd"

onready var icosa = get_node("Icosahedron")
onready var torus = get_node("Set of Toruses")
onready var narrator = get_node("Narrator")
onready var exonecute_text = get_node("Exonecute Text")
onready var color_shift = get_node("Color Shift")

func _ready():
	key = {"i" : icosa, "t" : torus, "n" : narrator}
	
	var choices = ["Show me your cool voice."]
	var scripts = [MULTI_VOICE]
	assert(len(choices) == len(scripts), "Choices must correspond to a script.")
	
	choicebox.populate(choices)
	
	direct_scene(parse_script(INTRO), scripts)
		
	
func end():
	exonecute_text.show()
	color_shift.duration /= 2
	yield(play_dialogue(parse_script(TIMES_UP)), "completed")
		
const INTRO = """
 	n :: short intro test.
	t :: HELLO.
	i :: hello !!
	"""
	
const MULTI_VOICE = """
	t :: LISTEN TO MY COOL VOICE.
	t :: THERE ARE THREE OF ME.
	t :: WOOO.
	"""
	
const TIMES_UP = """
	n :: ok. time's up. make your choice.
	"""
	
