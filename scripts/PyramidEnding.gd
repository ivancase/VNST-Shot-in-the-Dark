extends "res://scripts/EndingSystem.gd"

onready var pyramid = get_node("Pyramid")

func end():
	if Global.amt_convicted() == 4:
		pyramid.next_scene = "res://scenes/Finale.tscn"
	else:
		pyramid.next_scene = "res://scenes/Restart.tscn"
	yield(play_dialogue(parse_script(LAMENT)), "completed")
	pyramid.anim.playback_speed *= 2
	music.pitch_scale += 2
	yield(play_dialogue(parse_script(FAST)), "completed")

func _ready():
	Global.PYRAMID_CONVICTED = true
	
	key = {"n" : narrator, "p" : pyramid}
	direct_scene(parse_script(SPEECH), null)
	
func make_shootable():
	pyramid.shootable = true
	if pyramid.mouse_over:
		pyramid._on_mouse_enter()

const SPEECH = """
 	p :: yesyesyesyes
	p :: so fastsf atts fast
	p :: won't slow down
	p :: you (fast) couldn't hit me (FAST FAST FAST)
	p :: ...
	p :: who am i kidding
	p :: i knowyou'll shoot me (fast) eventually.
	n :: do you have a confession to make?
	p :: nope nope fastfast
	p :: didn't kill the mortal (fast)
	p :: never killed anyone (FASTfast)
	n :: god damn it.
	n :: let's get this over with, then.
	"""
	
const LAMENT = """
	p :: don'tpretend i don't (fast) know how (FAST) you see me
	p :: i know i'm fast (fast) (fastfast)
	p :: i know you (fast) know that FASTFASTFASTFAST
	p :: fastsfast sfast fast fsatsfas
	p :: but i can see past (fast) that
	p :: i'm a second thought.
	p :: look at me (ifyou can) (toofast), it's in my design FAST
	p :: three colors to my palette and one's the outline
	p :: at least when you aim (FAST FAST) at me
	p :: i get the thrill of a (FAST FAST FAST FAST) fourth
	p :: the FAST council just FASTFAST needed a fourth
	p :: FAST FASTFAST SO FAST FAST SO SO FAST
	p :: to make the framework work.
	p :: they don't think i did it. nobody FAST thinks i did it.
	p :: except you.
	p :: so (FASTFAST) thank you. for considering me.
	n :: ...
	p :: such metanarrative insignificance does horrors to a demon's psyche
	p :: FASTFAST FAST fast FAST FAST FASTSFAST
	p :: but that's neither here nor there FAST
	p :: because i'm neither here nor there
	p :: FAST FAST how are you FAST gonna shoot FAST me
	p :: IF I'M VERY
	p :: VERY
	"""

const FAST = """
	p :: FASTFASTSFASTASFASTASFASTASTFASTASFASTAFASTAFAST
	"""
