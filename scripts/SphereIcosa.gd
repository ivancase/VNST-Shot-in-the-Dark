extends "res://scripts/DialogSystem.gd"

onready var icosa = get_node("Icosahedron")
onready var sphere = get_node("Sphere")
onready var narrator = get_node("Narrator")
onready var exonecute_text = get_node("Exonecute Text")
onready var color_shift = get_node("Color Shift")

func _ready():
	key = {"i" : icosa, "s" : sphere, "n" : narrator}
	
	var choices = ["Who are you?", "Where were you?"]
	var scripts = [WHO, WHERE]
	assert(len(choices) == len(scripts), "Choices must correspond to a script.")
	
	choicebox.populate(choices)
	
	direct_scene(parse_script(INTRO), scripts)
		
	
func end():
	yield(play_dialogue(parse_script(TIMES_UP)), "completed")
	
	exonecute_text.show()
	color_shift.duration /= 2
		
const INTRO = """
 	n :: short intro test.
	s :: Hello.
	i :: hello !!
	"""

const WHO = """
	s :: I'm the magnificent sphere. You're saying you haven't heard of me?
	i :: i'm the icosahedron !! i'm just here for a good time ...
	n :: can you trust anyone here?
	"""
	
const WHERE = """
	s :: I'll admit I was in the overworld. I was searching for a new Operating System.
	i :: ...
	i :: that's a LIE !!!!!!!!!!!!!!
	i :: i saw you at the circle emporium !!!!! :OO
	s :: W- what are you talking about?!
	s :: Pointless libel!
	"""
	
const TIMES_UP = """
	n :: ok. time's up. make your choice.
	"""
	
