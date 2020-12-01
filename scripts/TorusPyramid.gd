extends "res://scripts/EndingSystem.gd"

onready var torus = get_node("Set of Toruses")
onready var pyramid = get_node("Pyramid")

func _ready():
	key = {"t" : torus, "p" : pyramid, "n" : narrator}
	
	direct_scene(parse_script(INTRO), null)
		
func direct_scene(intro, _scripts):
	if has_interim and !Global.INTERIM_OCCURED:
		Global.CURRENT_SCENE = filename
		Global.TRIAL_NAME = trial_name
		Global.CLOCK_TIME = clock_time
		get_tree().change_scene("res://scenes/Interim.tscn")
	
	Global.INTERIM_OCCURED = false
	
	yield(play_dialogue(intro), "completed")
	torus.body.get_node("anim").play("Toruses")
	end()
		
func end():
	yield(play_dialogue(parse_script(BAD_END)), "completed")
	get_tree().change_scene("res://scenes/Restart.tscn")
	
		
const INTRO = """
	t :: WAIT WHAT. CAN WE DO THAT.
	p :: heelll l yeah my fast brother!!!!!!
	"""
	
const BAD_END = """
	t :: WE FEEL. SO... FREE.
	n :: ok. no. this is absolutely awful. we're not doing this.
	"""
	
