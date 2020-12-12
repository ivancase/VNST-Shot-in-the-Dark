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
 	s :: Thank you, mortal.
	s :: You served as the final stepping stone of my legacy.
	s :: I won capitalism. I flouted the law. I had to be put down.
	s :: By you.
	n :: do you have a confession to make?
	s :: Ha! I'm afraid you've been had by my clever ruse, mortal.
	s :: I did not kill you.
	n :: god damn it.
	s :: One of the other demons must have done it.
	s :: And yet, I reap the rewards. An all too familiar feeling.
	s :: So why do I still feel so... hollow.
	"""
	
const PRE_CIRCLE = """
	s :: Ugh.
	s :: I guess it doesn't matter anymore, huh? My legacy is secured.
	s :: But I can't help feeling like I'm still teetering to one side,
	s :: About to fall off the roof.
	s :: ...
	s :: I've been lying to you.
	n :: no shit.
	n :: we fucked up because of you.
	s :: No, that too, but that's not what I mean. I've been lying to myself as well.
	s :: I guess I just thought if I pretended enough nobody would notice.
	s :: And the worst thing is, I guess nobody really did.
	s :: But it's eating away at me inside. Something's in there that isn't supposed to be.
	s :: I was a great Sphere, I really was. Everything they expected of me and more.
	s :: ...
	s :: But I'm not a Sphere.
	"""
	
const CIRCLE = """
	s :: I'm a Circle.
	s :: The shading is just painted on.
	s :: The pop ups cover it all up.
	s :: I'm completely flat. A demon of lesser dimension.
	s :: ...
	s :: Thank you, at least,
	s :: For giving me this final moment as myself.
	s :: A first moment, I suppose.
	"""
