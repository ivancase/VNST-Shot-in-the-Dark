extends "res://scripts/Intro.gd"


func _on_ready():
	key = {"n" : narrator, "c" : clock}
	
	direct_scene(parse_script(RESTART), null)

func end():
	clock.shootable = true
	if clock.mouse_over:
		clock._on_mouse_enter()
	yield(play_dialogue(parse_script(OVER)), "completed")

const RESTART = """
 	n :: this is the restart screen
	c :: clock appear
	n :: shoot the clock to restart ??? i guess??
	"""
const OVER = """
	n :: shoot the clock whenever you're ready.
	"""
