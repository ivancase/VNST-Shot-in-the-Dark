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
	n :: gotta admit, mortal. this was a bad call.
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
	t :: ~LEFT TORUS SAYS:~
	t :: You know, we don't really have to be bonded anymore.
	t :: ~RIGHT TORUS SAYS:~
	t :: Yeah. Death is on the line anyway. We're already screwed.
	t :: ~TOP TORUS SAYS:~
	t :: I agree. But it wouldn't be right to split up now.
	t :: Then the mortal would only have to shoot one of us.
	t :: No, they'll have to live with their error. And execute all three of us.
	t :: AT LEAST IT FEELS NICE. TO BE FREE. TO BE THREE.
	t :: WE ACCEPT DEATH, TOGETHER.
	n :: sorry mortal, there's no out of this one.
	"""
