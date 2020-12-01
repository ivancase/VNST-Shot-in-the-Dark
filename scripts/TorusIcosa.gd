extends "res://scripts/DialogSystem.gd"

onready var icosa = get_node("Icosahedron")
onready var torus = get_node("Set of Toruses")
onready var narrator = get_node("Narrator")
onready var exonecute_text = get_node("Exonecute Text")
onready var color_shift = get_node("Color Shift")

func _ready():
	key = {"i" : icosa, "t" : torus, "n" : narrator}
	
	var choices = ["Why are you a suspect?", "What do you do for fun?", "Eyes?"]
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
	t :: I DO NOT BLAME THE COUNCIL.
	t :: BUT I WAS GIVEN NO REASON.
	t :: AND NOW I MUST DIE.
	i :: haha i was due to be cycled out eventually :P
	i :: i think they kept me around so long because they like me !!
	i :: i guess that should make me happy :D
	i :: but i'm kind of glad they finally see me as a threat
	i :: turns out all i needed to do was cut you open !!
	"""

const FUN = """
	t :: FUN IS NOT MY PURPOSE.
	i :: sometimes i play games !!
	i :: for a few millenia i'd make a cube push a decommissioned sphere up a massive pyramid
	i :: when they reached the top, i'd devour them whole and let the sphere roll down :O
	i :: then i'd replace them with another cube !! or a mortal or something lol no offense
	i :: it never got old!
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
	i :: and rip
	i :: like picking grapes :P
	i :: i'd skewer them upon my limbs
	i :: see with my hands
	i :: my ~implements of death~ hehe
	i :: perhaps then i'd see me like they do :V
	t :: THIS DIGRESSION IS POINTLESS.
	t :: IT IS YOUR LEGAL DUTY TO EXONECUTE US IMMEDIATELY.
	"""
	
const TIMES_UP = """
	n :: ok. time's up. make your choice.
	"""
	
