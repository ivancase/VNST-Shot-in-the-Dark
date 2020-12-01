extends "res://scripts/DialogSystem.gd"

onready var pyramid = get_node("Pyramid")
onready var sphere = get_node("Sphere")
onready var narrator = get_node("Narrator")
onready var exonecute_text = get_node("Exonecute Text")
onready var color_shift = get_node("Color Shift")

func _ready():
	key = {"p" : pyramid, "s" : sphere, "n" : narrator}
	
	var choices = ["Why are you a suspect?", "What do you do for fun?", "Are you fast?"]
	var scripts = [SUSPECT, FUN, FAST]
	assert(len(choices) == len(scripts), "Choices must correspond to a script.")
	
	choicebox.populate(choices)
	
	direct_scene(parse_script(INTRO), scripts)
		
	
func end():
	exonecute_text.show()
	color_shift.duration /= 2
	yield(play_dialogue(parse_script(TIMES_UP)), "completed")
		
const INTRO = """
 	s :: I owe you my gratitude for sparing me.
	s :: Were my fate not sealed I'd offer you a job after this. You're a real straight shooter.
	n :: you're not. supposed. to talk!
	n :: unless asked a question. ahem,
	p :: fast fast fast fastfast i'm so fast
	p :: you can'tshoot me i'm too fast fastfast
	n :: sigh. ask away, mortal.
	"""

const FAST = """
	p :: fast fasttfastast fast fast
	p :: so so so os osf ast
	p :: i'm so fast
	s :: Jesus Christ.
	"""
	
const SUSPECT = """
	s :: Mostly because I killed you, I imagine.
	p :: nope i (fast) killed you (fastfast)
	s :: But I can't just assume it's the only reason I'm here.
	s :: ...
	s :: I think the Deometric Council's been looking to retire me for a while.
	s :: Replace me with a newer Sphere.
	s :: It's like they think there's something *wrong* with me.
	s :: But my form is immaculate. I'm a perfect Sphere.
	s :: To have me decommissioned would at the very least be an aesthetic sin.
	p :: you should (fastfastfast) decommission them FASTFASTFASTFAST
	"""

const FUN = """
	s :: ...
	p :: fast fastfastfsta fasasttt
	s :: I don't see how that's relevant.
	n :: you gotta answer. legally.
	s :: Sigh.
	s :: I don't.
	s :: Even tearing down other demons hasn't been fun for me anymore.
	s :: But that's what a Sphere does, you know. We're the elites of the Dark.
	s :: We're *better* than every over type of demon. Certainly compared to a Pyramid.
	s :: So how have I found myself among this... rabble.
	p :: i'm so oso osooos oso so ofoaSFa FAST FAST FAST
	n :: (wow. i bet he just wishes he was fast, too.)
	s :: I assure you that is most certainly not the case.
	"""

const TIMES_UP = """
	n :: ok, time's up. that was fast.
	"""
	
