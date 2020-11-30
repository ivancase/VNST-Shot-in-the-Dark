extends "res://scripts/DialogSystem.gd"

onready var clock = get_node("Clock")
onready var narrator = get_node("Narrator")

func _ready():
	key = {"n" : narrator, "c" : clock}
	
	direct_scene(parse_script(INTRO), null)
		
	
func end():
	clock.shootable = true
	
func direct_scene(intro, _scripts):
	yield(play_dialogue(intro), "completed")
	end()
		
const INTRO = """
 	n :: this is the restart screen
	c :: clock appear
	n :: shoot the clock to restart ??? i guess??
	"""
