extends "res://scripts/DialogSystem.gd"

onready var icosa = get_node("Icosahedron")
onready var sphere = get_node("Sphere")
onready var narrator = get_node("Narrator")
onready var exonecute_text = get_node("Exonecute Text")
onready var color_shift = get_node("Color Shift")

func _ready():
	key = {"i" : icosa, "s" : sphere, "n" : narrator}
	
	var choices = ["Have you killed before?", "How did I die?"]
	var scripts = [KILLED_BEFORE, HOW]
	assert(len(choices) == len(scripts), "Choices must correspond to a script.")
	
	choicebox.populate(choices)
	
	direct_scene(parse_script(INTRO), scripts)
		
	
func end():
	exonecute_text.show()
	color_shift.duration /= 2
	yield(play_dialogue(parse_script(TIMES_UP)), "completed")
		
const INTRO = """
 	n :: remember. you can shoot any one of these demons at any time, unprompted.
	i :: hey, we can hear you !!
	i :: i would not appreciate being shot until you know that i killed you :V
	n :: hush. this is an interrogation, you can't just say whatever.
	n :: here, we have two common demons.
	s :: Common? Why, I'm none other than the magnificent Sphere.
	s :: You're telling me you've never heard of me?
	s :: Well, I'll let you know one thing: you ought to shoot the pitiful thing across from me.
	s :: With such sharp geometry, they'll no doubt poke holes in their own story.
	s :: I had you killed swiftly and efficiently, if a bit out of schedule. You can thank me for that.
	n :: HUSH. this is not a back and forth thing i don't think you get this.
	n :: mortal: do you have any questions for these two?
	"""

const KILLED_BEFORE = """
	i :: haha !! good one !! :P
	i :: i know you're new here but i kill *all the time* !!!!!!!
	i :: usually other demons though ...
	i :: see these other shapes under my head piece? they're corpses X_X
	s :: That's grotesque and improper. Get yourself some proper adornments.
	s :: No, I must admit I don't typically murder. I'm much too busy.
	s :: But I've recently been trying to get into the business of it, as it's quite lucrative.
	s :: It's a pity that the hit was mis-timed. A bad investment.
	n :: wow. these demons are real pieces of work. i much prefer horology...
	"""
	
const HOW = """
	n :: i'm sorry that you can't remember, it's a legal thing.
	n :: intimate knowledge of your death could cloud your judgment of the trial.
	n :: demons don't do any *physical* killing to mortals, so the memory shouldn't matter all that much.
	n :: they're *supposed* to file paperwork to have deaths moved around and circumstances set up before hand.
	n :: obviously that didn't happen. looking at you two.
	i :: sorry !!
	n :: but i digress: how did you have the mortal killed?
	s :: A devious plan set decades in action, you see.
	s :: I'm financing a big tech company in the living world. They make big tech.
	s :: I'm talking absolutely massive computers.
	s :: They provide no benefit over normal computers, of course. They're mostly hollow on the inside.
	s :: One of these Big Tech Computers was left discarded on a roof. For years, refuse built up inside.
	s :: Rat carcasses and bird nests. Stuff that isn't supposed to be inside a computer. It got real heavy.
	s :: Then one day, it got too heavy on one side. It fell off the roof.
	s :: And landed right here on our little mortal. Tough break, kid.
	i :: ...
	i :: pfffft hahahaha omgg WHAT !!
	i :: that fucking sucks ??
	s :: ?
	i :: it's actually really cute that that's the best thing you can come up with :P
	i :: no, that's not how you died friend !!
	i :: i really like clock guy but i'm afraid to tell you he's wrong about a few things :C
	n :: ...
	i :: no offense !! really !!
	i :: but your memories were actually removed because of how traumatic your death was :D
	i :: i went up there to the big bright living world all on my own with my *sharp* geometry ,,,
	i :: found you out on the street ,,,
	i :: and i eviscerated you myself !!!!
	i :: hehehehe
	i :: you should have seen yourself :P
	i :: limb torn from limb
	i :: you're made of such lovely shapes <3 <3
	n :: ok ok please stop talking. i'm sorry you had to hear that, mortal.
	i :: sorry :V
	"""
	
const TIMES_UP = """
	n :: ok, time's up. make your choice. remember, shoot who you think *didn't* kill you.
	"""
	
