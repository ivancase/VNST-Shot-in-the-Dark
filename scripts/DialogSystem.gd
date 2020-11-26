extends Node2D

signal next

onready var icosa = get_node("Icosahedron")
onready var sphere = get_node("Sphere")
onready var narrator = get_node("Narrator")
onready var choicebox = get_node("Choice Box")
onready var shoot_sound = get_node("Shoot")
onready var timer = get_node("Timer")
onready var tween = get_node("Tween")
onready var exonecute_text = get_node("Exonecute Text")
onready var white_screen = get_node("White Screen")
onready var color_shift = get_node("Color Shift")

var target

func _ready():
	var choices = ["Who are you?", "Where were you?"]
	var scripts = [WHO, WHERE]
	assert(len(choices) == len(scripts), "Choices must correspond to a script.")
	
	choicebox.populate(choices)
	
	direct_scene(_parse_script(INTRO), scripts)
	
func _input(event):
	var boost_amt = 4
	if event.is_action_pressed("ui_accept"):
		emit_signal("next")
		timer.wait_time /= boost_amt
	if event.is_action_released("ui_accept"):
		timer.wait_time *= boost_amt
	if event.is_action_pressed("shoot"):
		_shoot()
		
func _shoot():
	shoot_sound.play()
	
	
	var flash_time = 1
	white_screen.show()
	tween.interpolate_property(white_screen, "color", Color(1, 1, 1, 1), Color(1, 1, 1, 0), flash_time, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()
	
	if target:
		target.die()
		
func _parse_script(script):
	var key = {"i" : icosa, "s" : sphere, "n" : narrator}
	
	var lines = script.strip_edges().split("\n")
	
	var dialogue = []
	for l in lines:
		var lineinfo = l.strip_edges().split("::")
		var actor = key[lineinfo[0].strip_edges()]
		var text = lineinfo[1].strip_edges()
		dialogue.append([actor, text])
	return dialogue
	
func _end():
	yield(play_dialogue(_parse_script(TIMES_UP)), "completed")
	
	exonecute_text.show()
	color_shift.duration /= 2
	
func direct_scene(intro, scripts):
	yield(play_dialogue(intro), "completed")
	while choicebox.any_enabled():
		choicebox.show()
		yield(choicebox, "choice")
			
		var choice_index = choicebox.get_choice()
		choicebox.disable(choice_index)
		choicebox.hide()
			
		var script = _parse_script(scripts[choice_index])
		yield(play_dialogue(script), "completed")
	_end()

func play_dialogue(dialogue):
	#dialogue e.g. [[sphere, "Hello."], [narrator, "Wow."]]
	for lineinfo in dialogue:
		var actor = lineinfo[0]
		var text = lineinfo[1]
		actor.enter_limelight()
		yield(actor.act(text), "completed")
		yield(self, "next")
		actor.exit_limelight()
		
const INTRO = """
 	n :: short intro test.
	s :: Hello.
	i :: hello !!
	"""

const WHO = """
	s :: I'm the magnificent sphere. You're saying you haven't heard of me?
	i :: i'm the icosahedron !! i'm just here for a good time ...
	n :: can you trust anyone here?
	"""
	
const WHERE = """
	s :: I'll admit I was in the overworld. I was searching for a new Operating System.
	i :: ...
	i :: that's a LIE !!!!!!!!!!!!!!
	i :: i saw you at the circle emporium !!!!! :OO
	s :: W- what are you talking about?!
	s :: Pointless libel!
	"""
	
const TIMES_UP = """
	n :: ok. time's up. make your choice.
	"""
	
