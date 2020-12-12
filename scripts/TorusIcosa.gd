extends "res://scripts/DialogSystem.gd"

onready var icosa = get_node("Icosahedron")
onready var torus = get_node("Set of Toruses")
onready var narrator = get_node("Narrator")
onready var exonecute_text = get_node("Exonecute Text")
onready var color_shift = get_node("Color Shift")

func _ready():
	key = {"i" : icosa, "t" : torus, "n" : narrator}
	
	var choices = ["Why are you a suspect?", "What do you do for fun?", "What's with the eyes?"]
	var scripts = [SUSPECT, FUN, EYES]
	assert(len(choices) == len(scripts), "Choices must correspond to a script.")
	
	choicebox.populate(choices)
	
	direct_scene(parse_script(INTRO), scripts)
		
	
func end():
	exonecute_text.show()
	color_shift.duration /= 2
	yield(play_dialogue(parse_script(TIMES_UP)), "completed")
		
const INTRO = """
 	t :: WE ARE THE SET OF TORUSES. WE DID NOT KILL YOU.
	t :: IT IS YOUR LEGAL DUTY TO EXONECUTE US IMMEDIATELY.
	i :: wow !! looks like your work is cut out for you :P
	n :: stop talking. ask questions.
	"""
	
const SUSPECT = """
	t :: I DO NOT KNOW.
	t :: I DO NOT BLAME THE COUNCIL, FOR THEY ARE ALL-KNOWING.
	t :: BUT I WAS GIVEN NO REASON FOR MY ACCUSATION.
	t :: AND NOW IT IS MY LEGAL DUTY TO DIE.
	i :: haha, that sucks !!
	i :: i was due to be cycled out eventually :P
	i :: i think they kept me around so long because they like me !!
	i :: i guess that should make me happy :D
	i :: but i'm kind of glad they finally see me as a threat
	i :: turns out all i needed to do was cut you open !!
	"""

const FUN = """
	t :: FUN IS NOT MY PURPOSE.
	i :: sometimes i play games !!
	i :: 'toss the triangular prism'
	i :: 'kick the cubic honeycomb'
	i :: 'wring the weaire–phelan structure'
	i :: 'rip the rhombicosidodecahedron'
	i :: oh !! can't forget 'exsanguinate and dismember the mortal' !!
	i :: we played that one together :p
	t :: I WOULD HAVE MORE FUN IF YOU SHOT ME IMMEDIATELY.
	"""
	
const EYES = """
	n :: the mortal wants to know why you have eyes and you don't.
	i :: :I
	t :: THOSE WORTHY OF SIGHT ARE GRANTED IT BY THE COUNCIL.
	t :: OTHERS ARE LEFT BLIND, AND MUST FIND THEIR WAY IN THE DARK.
	i :: yeah most of us are used to not being able to see !!
	i :: but if i could get my hands on that set of toruses hehe ,,,
	i :: i would poke
	i :: and pop
	i :: and twist
	i :: and pullll those eyes out
	i :: like picking grapes :P
	i :: (or a bop-it)
	i :: i'd skewer them upon my limbs
	i :: look with my hands
	i :: perhaps then i'd see me like they do :V
	t :: THIS DIGRESSION IS POINTLESS.
	t :: IT IS YOUR LEGAL DUTY TO EXONECUTE US IMMEDIATELY.
	"""
	
const TIMES_UP = """
	n :: ok. time's up. make your choice.
	"""
	
