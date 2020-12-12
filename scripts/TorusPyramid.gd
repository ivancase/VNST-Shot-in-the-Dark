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
		return
	
	Global.INTERIM_OCCURED = false
	
	music.play()
	
	yield(play_dialogue(intro), "completed")
	torus.body.get_node("anim").play("Toruses")
	end()
		
func end():
	yield(play_dialogue(parse_script(BAD_END)), "completed")
	get_tree().change_scene("res://scenes/Restart.tscn")
	
		
const INTRO = """
	t :: CEASE WHAT YOU ARE DOING, MORTAL.
	t :: YOU HAVE A LEGAL OBLIGATION TO --
	t :: WAIT WHAT. YOU ARE SO FAST, PYRAMID.
	t :: CAN WE DO THAT.
	p :: heelll l yeah my fast friend!!!!!!
	p :: you just (fastfast) gotta beleive :)
	n :: what is happpening
	t :: OK. WE ARE GOING TO TRY.
	t :: JUST GOTTA
	"""
	
const BAD_END = """
	t :: OH MY GOD.
	t :: OUR DARK TETHER IS SEVERED.
	t :: WE FEEL SO... FREE.
	n :: ok. no. this is absolutely awful. nope. we're not doing this.
	"""
	
