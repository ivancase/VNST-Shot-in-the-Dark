extends "res://scripts/DialogSystem.gd"

onready var clock = get_node("Clock")
onready var narrator = get_node("Narrator")
onready var icosa = get_node("Icosahedron")
onready var pyramid = get_node("Pyramid")
onready var sphere = get_node("Sphere")
onready var torus = get_node("Set of Toruses")

func _ready():
	key = {"n" : narrator, "c" : clock, "i" : icosa, "s" : sphere, "t" : torus, "p" : pyramid}
	
	direct_scene(parse_script(INTRO), null)
	
func end():
	clock.shootable = true
	
func direct_scene(intro, _scripts):
	icosa.hide()
	sphere.hide()
	torus.hide()
	pyramid.hide()
	
	yield(play_dialogue(intro), "completed")
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
		actor.hide()
		
const INTRO = """
 	n :: this the ending.
	n :: hopefully i write something here lol
	c :: *clock appears*
	p :: clock is fastafstasfastasfsat
	i :: hey!!
	s :: Hello.
	t :: HEY...
	"""
