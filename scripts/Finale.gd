extends "res://scripts/DialogSystem.gd"

onready var clock = get_node("Clock")
onready var narrator = get_node("Narrator")
onready var icosa = get_node("Icosahedron")
onready var pyramid = get_node("Pyramid")
onready var sphere = get_node("Sphere")
onready var torus = get_node("Set of Toruses")
onready var execute_text = get_node("Execute Text")

func _ready():
	key = {"n" : narrator, "c" : clock, "i" : icosa, "s" : sphere, "t" : torus, "p" : pyramid}
	
	music.play()
	direct_scene(parse_script(INTRO), null)
	
func end():
	execute_text.bbcode_text = "(the end until i update this :p)"
	
func direct_scene(intro, _scripts):
	icosa.hide()
	sphere.hide()
	torus.hide()
	pyramid.hide()
	
	yield(play_dialogue(intro), "completed")
	clock.enter_limelight()
	clock.set_time(4)
	yield(play_dialogue(parse_script(FIXED)), "completed")
	execute_text.show()
	narrator.shootable = true
	yield(play_last(parse_script(LAST)), "completed")
	end()
	
func play_dialogue(dialogue):
	#dialogue e.g. [[sphere, "Hello."], [narrator, "Wow."]]
	for lineinfo in dialogue:
		var actor = lineinfo[0]
		var text = lineinfo[1]
		actor.enter_limelight()
		actor.show()
		yield(actor.act(text), "completed")
		yield(self, "next")
		actor.exit_limelight()
		actor.hide()

func play_last(dialogue):
	for lineinfo in dialogue:
		var actor = lineinfo[0]
		var text = lineinfo[1]
		actor.enter_limelight()
		actor.show()
		yield(actor.act(text), "completed")
		yield(self, "next")
		
const INTRO = """
 	n :: fuck.
	n :: we're done for. we messed up. *you* messed up.
	n :: no. that's not fair.
	n :: the Council messed up, i guess. none of the suspects did it.
	n :: but the council's never wrong...
	c :: *clock appears*
	p :: hey.
	p :: you're the clock guy, right?
	n :: jesus christ.
	n :: what do *you* want??
	p :: chill out for a second.
	p :: i just wanted (fast) to tell you.
	p :: your clock is fast.
	n :: ...
	n :: what?
	p :: yeah, by like an hour.
	c :: clock appears
	"""
	
const FIXED = """
	n :: ...
	n :: so it was my fault. the whole time.
	n :: i need a second.
	n :: ...
	n :: ...
	n :: ...
	"""

const LAST = """
	n :: i guess you know what to do.
	"""
