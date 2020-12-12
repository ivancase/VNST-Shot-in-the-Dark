extends "res://scripts/EndingSystem.gd"

onready var icosahedron = get_node("Icosahedron")

func end():
	if Global.amt_convicted() == 4:
		icosahedron.next_scene = "res://scenes/Finale.tscn"
	else:
		icosahedron.next_scene = "res://scenes/Restart.tscn"
	yield(play_dialogue(parse_script(LEGACY)), "completed")

func _ready():
	Global.ICOSAHEDRON_CONVICTED = true
	
	key = {"n" : narrator, "i" : icosahedron}
	direct_scene(parse_script(SPEECH), null)
	
func make_shootable():
	icosahedron.shootable = true
	if icosahedron.mouse_over:
		icosahedron._on_mouse_enter()

const SPEECH = """
	i :: hahahaha !!!!
	i :: yes :D :D
	i :: i never thought i'd see the day i got executed by the state
	i :: the other demons are gonna see me differently now i just know it !!
	n :: so, did you do it?
	n :: did you kill the mortal?
	i :: hehe
	i :: i've certainly killed a few :p
	i :: but not this one :L
	n :: fuck.
	i :: sorry !!
	i :: i do wish i was there for it
	i :: to see your crimson blood pour out
	i :: watching it pool on the floor ,,,
	i :: dancing in it !!
	n :: that's disgusting.
	"""
	
const LEGACY = """
	i :: *i'm* disgusting !!!!!!!!!!!!!!!!!!!!
	i :: why does nobody else see it that way ,,,
	i :: every other demon sees me as a cute lil icosahedron
	i :: who does silly murders and is made of twenty funny triangles ,,,
	i :: which sucks because
	i :: that's true !!!! :V
	i :: i am really cute !! i'm very funny !! i'm ~silly~ !!!!
	i :: but those things aren't antithetical to being ruthless and gruesome
	i :: in fact ,,,
	i :: they can complement a demon's odiousness quite nicely !!!!
	i :: ...
	i :: you know, when one of us demons is decommissioned, they make another one :L
	i :: of the same shape and status :o
	i :: with a fresh start
	i :: i'm hoping that the results of this trial inspire them ,,,
	i :: to be gruesome. to be gross.
	i :: to be heinous !!
	i :: and maybe the Dark will see them that way, too.
	"""
