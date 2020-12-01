extends "res://scripts/EndingSystem.gd"

onready var torus = get_node("Set of Toruses")
onready var pyramid = get_node("Pyramid")

func _ready():
	key = {"t" : torus, "p" : pyramid, "n" : narrator}
	
	direct_scene(parse_script(INTRO), null)
		
func direct_scene(intro, _scripts):
	if has_interim and !Global.INTERIM_OCCURED:
		Global.CURRENT_SCENE = filename
		print(Global.CURRENT_SCENE)
		Global.TRIAL_NAME = trial_name
		Global.CLOCK_TIME = clock_time
		get_tree().change_scene("res://scenes/Interim.tscn")
	
	Global.INTERIM_OCCURED = false
	
	yield(play_dialogue(intro), "completed")
	end()
		
func end():
	yield(play_dialogue(parse_script(BAD_END)), "completed")
	.end()
	
		
const INTRO = """
	t :: WAIT WHAT. I CAN DO THAT
	p :: heelll l yeah my fast brother!!!!!!
	t :: I FEEL. SO... FREE.
	"""
	
const BAD_END = """
	n :: ok. no. this is absolutely awful.
	"""
	
