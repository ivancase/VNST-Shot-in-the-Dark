extends "res://scripts/DialogSystem.gd"

onready var icosa = get_node("Icosahedron")
onready var pyramid = get_node("Pyramid")
onready var narrator = get_node("Narrator")
onready var exonecute_text = get_node("Exonecute Text")
onready var color_shift = get_node("Color Shift")

func _ready():
	key = {"i" : icosa, "p" : pyramid, "n" : narrator}
	
	var choices = ["Do you need their respect?", "Ever killed a Pyramid?"]
	var scripts = [RESPECT, KILL_PYRAMID]
	assert(len(choices) == len(scripts), "Choices must correspond to a script.")
	
	choicebox.populate(choices)
	
	direct_scene(parse_script(INTRO), scripts)
		
	
func end():
	exonecute_text.show()
	color_shift.duration /= 2
	yield(play_dialogue(parse_script(TIMES_UP)), "completed")
		
const INTRO = """
 	n :: okay. here's the last two.
	p :: fastsfastastasfastasfstas.
	p :: i'm so soo so very fasst
	p :: can't can't shoot me toofast
	n :: don't talk yet how many times do i have to
	i :: *this* is what i'm up against ?? D:<
	n :: ?
	p :: ? (fast)
	i :: i can not believe this !!
	i :: i thought the council was actually starting to respect me !!!!
	i :: but no no no no
	i :: i've killed an uncountable number of demons and mortals
	i :: and they see me equal to this stupid dumb pointy thing !!!!
	n :: (that's a pyramid)
	p :: (fast fast fast)
	i :: I KNOW !!!!!!!!!!!!!!!!!!!!
	"""
	
const RESPECT = """
	i :: no ??
	i :: of course not ????????????????????
	i :: but it would be *nice* to have !! for once !!
	p :: fastfast fast fast
	i :: i know how the other demons see me ,,,
	i :: i'm *cute* and *silly* to them :<
	i :: they see me like this little *thing* !!
	i :: meanwhile i could easily swipe it out of the air
	p :: nope toofast
	i :: and turn it into a shitty hat !!!!
	"""

const KILL_PYRAMID = """
	i :: a pile of these putrid things lays in the corner of my domicile
	p :: weren't asfast as me
	i :: they were very fast !!
	i :: and i still killed them !!!!
	i :: because i'm very good at killing things you asshole !!!!!!!! D:<
	"""
	
const TIMES_UP = """
	n :: ok. time's up. whoever you don't shoot will be pronounced guilty.
	"""
	
