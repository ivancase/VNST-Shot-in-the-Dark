extends "res://scripts/DialogSystem.gd"

onready var clock = get_node("Clock")
onready var narrator = get_node("Narrator")

func _ready():
	key = {"n" : narrator, "c" : clock}
	
	direct_scene(parse_script(INTRO), null)
		
	
func end():
	clock.shootable = true
	if clock.mouse_over:
		clock._on_mouse_enter()
	
func direct_scene(intro, _scripts):
	yield(play_dialogue(intro), "completed")
	end()
		
const INTRO = """
 	n :: so, you're dead.
	n :: welcome to the Dark.
	n :: ...
	n :: i'm not a spirit guide or anything. i'm actually the clock guy around here. i set the clocks and such.
	c :: *clock appears.*
	n :: but something's wrong and it's in my jurisdiction.
	n :: ...
	n :: you see, you died an hour ahead of schedule. which means a Demon has been meddling around with your death. that's never good.
	n :: the Deometric Council has put together a list of suspects:
	n :: the Sphere,
	n :: the Icosahedron,
	n :: the Set of Toruses,
	n :: and the Pyramid.
	n :: you'll notice that you have a gun. tonight you will execute all four of them. but only one will be proclaimed guilty.
	n :: demon law, i know.
	n :: whoever is proclaimed guilty by the end of the night will reap, as they say, \"hella clout\" for flouting the law.
	n :: no doubt, even the innocent demons will try to convince you of their guilt for a taste of that fame.
	n :: it is your job to interrogate them two at a time and exonecute who you think is innocent. when one remains, we've found our perpetrator.
	n :: then we shoot them.
	n :: well, you will shoot them. i'm just here to help.
	n :: whenever you're ready, shoot the clock and we'll begin our first trial.
	"""
