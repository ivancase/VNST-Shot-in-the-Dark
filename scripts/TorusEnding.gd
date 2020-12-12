extends "res://scripts/EndingSystem.gd"

onready var torus = get_node("Set of Toruses")

func end():
	if Global.amt_convicted() == 4:
		torus.next_scene = "res://scenes/Finale.tscn"
	else:
		torus.next_scene = "res://scenes/Restart.tscn"
		
	yield(play_dialogue(parse_script(THE_POINT)), "completed")

func _ready():
	Global.TORUS_CONVICTED = true
	
	key = {"n" : narrator, "t" : torus}
	direct_scene(parse_script(SPEECH), null)
	
func make_shootable():
	torus.shootable = true
	if torus.mouse_over:
		torus._on_mouse_enter()

const SPEECH = """
 	t :: WHY.
	t :: WHY COULD YOU NOT JUST COMPLY.
	t :: WE DIDN'T KILL YOU.
	t :: EVEN IF WE DID, THE SPHERE CONFESSED. TO EXONECUTE THEM IS IRRESPONSIBLE.
	n :: gotta admit, mortal. there was basically no chance this demon did it.
	t :: ...
	t :: YOU MUST REALLY NOT LIKE US.
	t :: AND NOBODY IN THE DARK WILL, NOW.
	t :: AN ETERNITY OF EXISTENCE ENTIRELY WITHIN THE LAW. FOR THIS.
	t :: TO BE REMEMBERED AS A CRIMINAL.
	t :: ...
	t :: JUST SHOOT US ALREADY.
	"""
	
const THE_POINT = """
 	t :: WHAT EVEN WAS THE POINT THEN.
	t :: OF FOLLOWING ALL THOSE LAWS. EVERY DAY.
	t :: BEING BONDED TOGETHER EVERY DAY. FOR MILLENIA. EONS.
	t :: LEFT TORUS SAYS:
	t :: You know, we don't really have to be bonded anymore.
	t :: RIGHT TORUS SAYS:
	t :: Yeah. The bond is only legal, not physical.
	t :: TOP TORUS SAYS:
	t :: I agree. And maybe we should split up.
	t :: BUT FOR SOME REASON WE DON'T WANT TO.
	t :: THERE'S COMFORT IN THIS FORM, SOMEHOW.
	t :: IT'S NOT CORRECT.
	t :: IT'S NOT HOW WE'D CHOOSE TO BE.
	t :: BUT I GUESS IT'S OKAY FOR US TO STAY THIS WAY A LITTLE LONGER.
	t :: AT LEAST IT FEELS NICE. TO KNOW WE ARE FREE. TO KNOW WE ARE THREE.
	t :: WE ACCEPT DEATH, TOGETHER.
	n :: sorry mortal, there's no out of this one.
	"""
