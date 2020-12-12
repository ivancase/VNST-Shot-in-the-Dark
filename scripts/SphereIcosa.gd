extends "res://scripts/DialogSystem.gd"

onready var icosa = get_node("Icosahedron")
onready var sphere = get_node("Sphere")
onready var narrator = get_node("Narrator")
onready var exonecute_text = get_node("Exonecute Text")
onready var color_shift = get_node("Color Shift")

func _ready():
	key = {"i" : icosa, "s" : sphere, "n" : narrator}
	
	var choices = ["How did I die?", "Have you killed before?", "What happens to me?"]
	var scripts = [HOW, KILLED_BEFORE, HAPPENS_AFTER]
	assert(len(choices) == len(scripts), "Choices must correspond to a script.")
	
	choicebox.populate(choices)
	
	direct_scene(parse_script(INTRO), scripts)
		
	
func end():
	exonecute_text.show()
	color_shift.duration /= 2
	yield(play_dialogue(parse_script(TIMES_UP)), "completed")
		
const INTRO = """
	n :: remember: during each trial, you can shoot any demon at any time.
	n :: you are judge, jury, and executioner.
	i :: we can hear you, you know !!
 	i :: mortal, i would not appreciate being shot until you know that i killed you :V
	n :: quiet. you're being questioned, you can't just talk whenever you want.
	n :: here, we have two common demons.
	s :: Common? Why, I'm none other than the magnificent Sphere.
	s :: You're telling me you've never heard of me?
	s :: Well, I'll let you know one thing: you ought to shoot the pitiful thing across from me.
	s :: With such sharp geometry, they'll no doubt poke holes in their own story.
	s :: I had you killed swiftly and efficiently, if a bit out of schedule. You can thank me for that.
	n :: HUSH. this is not a back-and-forth thing i don't think you get this.
	n :: mortal: do you have any questions for these two?
	"""

const KILLED_BEFORE = """
	i :: haha !! good one !! :P
	i :: i know you're new here but i kill *all the time* !!!!!!!
	i :: usually other demons though ...
	i :: see these other shapes under my head piece? they're corpses X_X
	s :: That's grotesque. Get yourself some proper adornments.
	s :: No, I must admit I don't typically murder. I'm much too busy.
	s :: But I've recently been trying to get into the business of it, as it's quite lucrative.
	s :: It's a pity that your death was mis-timed. A bad investment.
	n :: wow. these demons are real pieces of work. i much prefer horology...
	"""
	
const HOW = """
	n :: i'm sorry that you can't remember. it's a legal thing.
	n :: intimate knowledge of your death could cloud your judgment of the trial. especially the trauma.
	n :: demons usually cause deaths indirectly, so the memory shouldn't matter all that much.
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
	s :: Then one day, too much weight piled onto one side. It fell off the roof.
	s :: And landed right on our little mortal. Tough break, kid.
	i :: ...
	i :: pfffft hahahaha omgg WHAT !!
	i :: that fucking sucks ??
	s :: Watch your tone, Icosahedron.
	i :: it's actually really cute that that's the best thing you can come up with :P
	i :: no, that's not how you died friend !!
	i :: you should be happy your memory isn't present, hehe
	i :: your death was outstandingly traumatic !! i made sure of it :D
	i :: i crawled up there to the big bright living world with my *sharp* geometry ,,,
	i :: i stalked and searched and found you alone
	i :: and i eviscerated you myself !!!!
	i :: hehehehe
	i :: you should have seen yourself :P
	i :: limb torn from limb
	i :: you're made of such lovely shapes <3 <3
	n :: ok ok please stop talking. 
	n :: i'm sorry you had to hear that, mortal.
	i :: sorry :V
	"""
const HAPPENS_AFTER = """
	n :: after this?
	n :: you'll be handed off to standard mortal processing.
	n :: a panel of demons will decide your judgment.
	n :: if you're here in the Dark... don't expect a great outcome, is all.
	s :: I've served on such a panel, mortal. The lesser demons despised me.
	s :: If you proclaim me guilty you just may get a better result.
	s :: Perhaps even my respect, if you're lucky.
	i :: hey !! no fair !! :I
	i :: not all of us are hated enough to use it as leverage :C
	"""	
	
const TIMES_UP = """
	n :: ok, time's up. make your choice. remember, shoot who you think *didn't* kill you.
	"""
	
