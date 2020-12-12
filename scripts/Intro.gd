extends "res://scripts/DialogSystem.gd"

onready var clock = get_node("Clock")
onready var narrator = get_node("Narrator")

func _ready():
	_on_ready()

func _on_ready():
	key = {"n" : narrator, "c" : clock}
	
	direct_scene(parse_script(INTRO), null)
	
func end():
	get_tree().change_scene("res://scenes/SphereIcosa.tscn")
	
func direct_scene(intro, _scripts):
	yield(play_dialogue(intro), "completed")
	end()
	
const INTRO = """
 	n :: so, you're dead.
	n :: welcome to the Dark.
	n :: ...
	n :: i'm not a spirit guide or anything. i'm actually the clock guy around here. i set the clocks and all that.
	c :: *clock appears.*
	n :: but something's gone wrong and it's in my jurisdiction.
	n :: ...
	n :: every mortal has a predetermined time of death. it's all very neat and tidy and i keep track of it.
	n :: you, however, died an hour ahead of schedule. that means some demon down here has been meddling with your death.
	n :: the Deometric Council has put together a list of suspects:
	n :: the Sphere,
	n :: the Icosahedron,
	n :: the Set of Toruses,
	n :: and the Pyramid.
	n :: you may have noticed that you have a gun. 
	n :: tonight you will execute *all four* of these demons. only one of them will be proclaimed guilty.
	n :: demon law, i know.
	n :: whoever you deem guilty, will reap, as they say, \"hella clout\" for flouting the law.
	n :: no doubt, even the innocent demons will try to convince you of their guilt for a taste of that fame. they're dying anyways.
	n :: it is your job to interrogate them two at a time and exonecute who you think is innocent. by shooting them.
	n :: we'll cycle through all the demons until one remains alive. then, we've found our guilty party.
	n :: you'll shoot them, too.
	n :: it's my job to help you with this as best i can. if we - well, *you* - screw up, i'll be shot too.
	n :: but that's neither here nor there. the clock is ticking. let's start our first trial.
	"""
