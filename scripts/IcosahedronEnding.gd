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
	i :: tysm omgg haha
	i :: they're gonna change their tune about me now i just know it :B
	n :: so? did you do it? did you kill the mortal?
	i :: oh, you'll have to be more specific ,,,
	i :: i lied earlier. i've killed a looooooot of mortals !!
	i :: nothing makes me happier than to see that crimson blood pour out
	i :: letting it pool on the floor ,,,
	i :: and dancing in it !! :D
	n :: ...
	n :: that's disgusting.
	i :: :I
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
	"""
	
const LEGACY = """
	i :: you know, when one of us demons is decommissioned, they make another one :L
	i :: of the same shape and status !!
	i :: with a fresh start
	i :: i'm hoping that the results of this trial inspire them ,,,
	i :: to be gruesome. to be gross.
	i :: to be heinous !!
	i :: and maybe the Dark will see them that way, too.
	"""
