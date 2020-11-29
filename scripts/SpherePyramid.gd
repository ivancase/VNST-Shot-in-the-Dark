extends "res://scripts/DialogSystem.gd"

onready var pyramid = get_node("Pyramid")
onready var sphere = get_node("Sphere")
onready var narrator = get_node("Narrator")
onready var exonecute_text = get_node("Exonecute Text")
onready var color_shift = get_node("Color Shift")

func _ready():
	key = {"p" : pyramid, "s" : sphere, "n" : narrator}
	
	var choices = ["Are you fast?"]
	var scripts = [FAST]
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
	p :: hellohheloooooo 
	"""

const FAST = """
	p :: fast fasttfastast fast fast
	p :: so so so os osf ast
	p :: i'm so jast
	s :: Jesus Christ.
	"""

const TIMES_UP = """
	n :: ok. time's up. make your choice.
	"""
	
