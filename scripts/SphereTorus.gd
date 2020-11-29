extends "res://scripts/DialogSystem.gd"

onready var sphere = get_node("Sphere")
onready var torus = get_node("Set of Toruses")
onready var narrator = get_node("Narrator")
onready var exonecute_text = get_node("Exonecute Text")
onready var color_shift = get_node("Color Shift")

func _ready():
	key = {"s" : sphere, "t" : torus, "n" : narrator}
	
	var choices = ["Placeholder."]
	var scripts = [PLACEHOLDER]
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
	t :: HELLO.
	"""
	
const PLACEHOLDER = """
	n :: this is a placeholder dawg
	"""
	
const TIMES_UP = """
	n :: ok. time's up. make your choice.
	"""
	
