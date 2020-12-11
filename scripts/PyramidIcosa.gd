extends "res://scripts/DialogSystem.gd"

onready var icosa = get_node("Icosahedron")
onready var pyramid = get_node("Pyramid")
onready var narrator = get_node("Narrator")
onready var exonecute_text = get_node("Exonecute Text")
onready var color_shift = get_node("Color Shift")

func _ready():
	key = {"i" : icosa, "p" : pyramid, "n" : narrator}
	
	var choices = ["You okay?", "Never seen a Pyramid?", "Dizzy?", "Did you kill me?"]
	var scripts = [RESPECT, KILL_PYRAMID, DIZZY, KILL_ME]
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
	n :: don't talk yet how many times do i have to --
	i :: *this* is what i'm up against ?? :C
	n :: ?
	p :: ? (fast)
	i :: i thought the Council was actually starting to respect me !!!!
	i :: but no no no no
	i :: i've killed an uncountable number of demons and mortals
	i :: and they see me equal to this stupid dumb fast thing !!!!
	n :: (that's a pyramid)
	p :: (fast fast fast)
	i :: I KNOW !!!!!!!!!!!!!!!!!!!!
	"""
	
const RESPECT = """
	i :: no !!!!
	i :: i'm not \"okay\" ,,,
	i :: i know how the other demons see me
	i :: i know how the COUNCIL sees me
	p :: they don't see me
	p :: too fastfast FASTFAST
	i :: they see me as *CUTE* !!!!
	i :: AND QUIRKY !!!!!!
	n :: ...
	n :: are you not?
	i :: OF COURSE I AM YOU FETID CLOCK THING :V
	i :: but i am also
	i :: really really dangerous !!!!
	i :: ....
	i :: i just want them to see me that way :(
	p :: SO FASTA FSAT ASFAST ASFASFAS ASF SFAS FAS FASFFAST
	i :: please shoot this thing before i impale it
	"""

const KILL_PYRAMID = """
	i :: I KNOW WHAT A PYRAMID IS.
	i :: a pile of these putrid things lays in the corner of my domicile
	p :: weren't asfast as me
	i :: THEY WERE EXTREMELY FAST AND ANNOYING
	i :: and i still killed them !!!!
	i :: because i'm very good at killing things you asshole !!!!!!!! :V
	"""
	
const DIZZY = """
	n :: okay this one's a personal question straight from me
	n :: do you guys ever get dizzy?
	i :: what ,,,
	p :: FAST
	n :: cause like.
	n :: that one's always zooming around and whatever.
	n :: and your head piece is spinning all the time.
	p :: TOO FAST TO CARE
	i :: .... yes :C
	i :: sometimes i try to lunge at someone but i'm so lightheaded i fall over
	i :: and they think i'm doing a funny joke !
	i :: but it's not a joke ,,,
	i :: i want to kill and wear them :(
	"""	
	
const KILL_ME = """
	n :: okay, but, uh, pyramid guy.
	p :: FAST FAST FASTFASTF AST
	n :: right.
	n :: i don't even know why we're asking this.
	n :: did you kill the mortal?
	p :: FAST FAST FAST FAST
	p :: A FAST OBJECT
	p :: CAN IMPART (FAST)
	p :: A LOT OF (FASTFAST) MOMENTUM
	p :: FAST FAST
	n :: so, let me get this straight:
	n :: you ran into them so fast they died?
	p :: FAST FAST FAST FASTFAST
	i :: do i even have to tell you who's lying ?? :C
	"""
const TIMES_UP = """
	n :: ok. time's up. whoever you don't shoot will be pronounced guilty.
	"""
	
