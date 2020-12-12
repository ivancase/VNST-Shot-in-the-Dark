extends "res://scripts/Intro.gd"


func _on_ready():
	key = {"n" : narrator, "c" : clock}
	
	var scripts = [ZERO, FIRST, SECOND, THIRD]
	var index = Global.amt_convicted()
	
	music.play()
	direct_scene(parse_script(scripts[index]), null)

func end():
	clock.shootable = true
	if clock.mouse_over:
		clock._on_mouse_enter()
	yield(play_dialogue(parse_script(OVER)), "completed")
	
const ZERO = """
	n :: i'm sorry but that was the worst thing i've ever witnesed.
	n :: that is not something i want to deal with right now.
	n :: so
	n :: i shouldn't be doing this.
	c :: clock appear
	n :: but i'm going to set the clock back.
	n :: we can try this again.
	n :: maybe make sure those two don't end up against each other.
"""

const FIRST = """
	c :: clock appear
 	n :: fuck fuck fuck
	n :: ok ok we screwed up. we got the wrong demon.
	n :: i don't want to die.
	n :: ...
	n :: okay, this is a bad idea.
	n :: but i'm going to break the rules a little.
	n :: i'm *really* not allowed to do this.
	n :: i'm going to set the clock back.
	n :: we can try again. from the beginning.
	n :: you've got three other demons to accuse.
	"""

const SECOND = """
 	n :: no no no no.
	n :: how could we screw up *twice*.
	n :: it's okay it's okay.
	n :: we'll try again. you'll get it right.
	n :: god i hope the Council doesn't notice...
	n :: i'm completely abusing my responsibilities.
	n :: whatever. two more demons left to accuse.
	c :: clock appear
	"""
	
const THIRD = """
 	n :: OK.
	n :: NO PANICKING.
	n :: WE'LL SET THE CLOCK BACK AGAIN. THAT LEAVES ONE MORE DEMON.
	n :: it has to be them. this is our last chance.
	c :: clock appear
	"""
	
const OVER = """
	n :: shoot the clock whenever you're ready.
	"""
