extends "res://scripts/EndingSystem.gd"

onready var sphere = get_node("Sphere")

func end():
	if Global.amt_convicted() == 4:
		sphere.next_scene = "res://scenes/Finale.tscn"
	else:
		sphere.next_scene = "res://scenes/Restart.tscn"
	
	yield(play_dialogue(parse_script(PRE_CIRCLE)), "completed")
	sphere.anim.set_animation("circle")
	yield(play_dialogue(parse_script(CIRCLE)), "completed")

func _ready():
	Global.SPHERE_CONVICTED = true
	
	key = {"n" : narrator, "s" : sphere}
	direct_scene(parse_script(SPEECH), null)
	
func make_shootable():
	sphere.shootable = true
	if sphere.mouse_over:
		sphere._on_mouse_enter()

const SPEECH = """
 	s :: Haha! Yes.
	s :: I did it. I'm the last left alive.
	s :: Thus cements my legacy:
	s :: The Sphere that won capitalism and had to be put down.
	n :: you're a goner now, no matter what.
	n :: do you have a confession to make?
	s :: Ha! I'm afraid you've been had by my clever ruse, mortal.
	s :: I did not kill you.
	n :: god damn it.
	s :: Through careful trickery I've convinced you to exonecute all of the others.
	s :: One of them must have done it, yet I reap the rewards. That's practically my business model!
	s :: So why do I still feel so... hollow.
	"""
	
const PRE_CIRCLE = """
	s :: Ugh.
	s :: I guess it doesn't matter anymore, huh? My legacy is secured.
	s :: But I can't help feeling like I'm still teetering to one side,
	s :: Another rat carcass lining my metaphorical interior. About to fall off the roof.
	s :: ...
	s :: I've been lying to you.
	n :: no shit.
	n :: we fucked up because of you.
	s :: No, that too, but that's not what I mean. I've been lying to myself as well.
	s :: I've been lying to everyone, I guess secretly hoping someone would catch on.
	s :: But nobody ever saw it. In the eternity I've lived.
	s :: I'm not a Sphere...
	"""
	
const CIRCLE = """
	s :: I'm a Circle.
	s :: The shading is just painted on.
	s :: The pop ups just cover it up.
	s :: I'm completely flat. A lesser dimension.
	s :: ...
	s :: Thank you, at least,
	s :: For giving me this final moment as my self.
	"""
