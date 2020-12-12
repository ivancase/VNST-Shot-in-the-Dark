extends "res://scripts/DialogSystem.gd"

onready var clock = get_node("Clock")
onready var narrator = get_node("Narrator")
onready var icosa = get_node("Icosahedron")
onready var pyramid = get_node("Pyramid")
onready var sphere = get_node("Sphere")
onready var torus = get_node("Set of Toruses")
onready var execute_text = get_node("Execute Text")
onready var wait = get_node("Wait")
onready var ticking = get_node("Ticking")
onready var end_music = get_node("End")

func _ready():
	key = {"n" : narrator, "c" : clock, "i" : icosa, "s" : sphere, "t" : torus, "p" : pyramid}
	
	sphere.body.get_node("floating").play("circle")
	music.play()
	direct_scene(parse_script(INTRO), null)
	
func end():
	yield(narrator.fade_out(5), "completed")
	Global.GOOD_END = true
	get_tree().change_scene("res://scenes/MainMenu.tscn")
	
func direct_scene(intro, _scripts):
	icosa.hide()
	sphere.hide()
	torus.hide()
	pyramid.hide()
	
	yield(play_dialogue(intro), "completed")
	
	clock.enter_limelight()
	clock.act("change time")
	clock.set_time(4)
	
	yield(play_dialogue(parse_script(FIXED)), "completed")
	
	narrator.enter_limelight()
	narrator.act("[center]i guess you know what to do.")
	narrator.shootable = true
	
	execute_text.show()
	
	music.stop()
	ticking.play()
	
	wait.start()
	yield(wait, "timeout")
	
	yield(play_dialogue(parse_script(DIDNT_SHOOT)), "completed")
	
	clock.hide()
	ticking.stop()
	end_music.play()
	
	yield(play_dialogue(parse_script(FUCK_THE_LAW)), "completed")
	narrator.enter_limelight()
	narrator.shootable = false
	inputs_disabled = true
	
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
		
const INTRO = """
 	n :: fuck.
	n :: we're done for. we messed up. *you* messed up.
	n :: no. that's not fair.
	n :: the Council messed up, i guess. none of the suspects did it.
	n :: but the Council's never wrong...
	p :: hey.
	p :: you're the clock guy, right?
	n :: jesus christ.
	n :: what do *you* want??
	n :: and why are you so slow all of a sudden????
	p :: chill out for a second.
	p :: those shots to the forward face (fast. fast.) cleared my head a little.
	p :: so, i've just been meaning (fast.) to tell you.
	p :: your clock is fast.
	n :: ...
	n :: what?
	p :: yeah, by like an hour.
	c :: clock appears
	p :: here, let me fix it for you.
	"""
	
const FIXED = """
	n :: ...
	n :: so...
	n :: so it was my fault. the whole time.
	n :: you didn't die an hour early. my clock was an hour late.
	n :: i've completely failed at the one thing i was created for.
	n :: i need a second.
	n :: ...
	n :: ...
	n :: ...
	"""
	
const DIDNT_SHOOT = """
	n :: ....really?
	n :: after all i've done.
	n :: i've shirked my duties. i've abused my control over the clocks.
	n :: by now, i bet they're all starting to piece things together.
	n :: the memories are pouring back in. i've made you kill these poor demons over, and over.
	n :: they'll remember the injustice. and the agony. bullets hurt, you know.
	n :: i'm a monster.
	n :: so just
	n :: SHOOT ME LIKE ONE.
	n :: it's the law.
	n :: ...
	n :: ...
	n :: ...
	"""

const FUCK_THE_LAW = """
	t :: FUCK THE LAW.
	n :: what?
	t :: FUCK THE LAW. FUCK THE COUNCIL. IT'S ALL A SHAM.
	s :: Yes. I'm with the Toruses.
	s :: The Council set us up for failure. They've inhibited us for too long.
	s :: We're done with their rule over our lives and our deaths.
	i :: yes !! these rigged courts really suck :C
	i :: ... kinda dig the senseless murder part though hehe
	n :: i did this to you guys. to all of you. *i* fucked up.
	n :: i was never fit to run the clocks in the first place.
	n :: i didn't deserve to be created.
	n :: so i deserve to be destroyed.
	p :: no you (fast. fast, fast.) don't.
	p :: you're not broken. the system is.
	p :: we don't deserve to be treated (fast.) like this.
	p :: we (fast fast.) don't deserve to feel (FAST.) like this.
	t :: NONE OF US DESERVE THIS. NOT EVEN YOU, CLOCK PERSON.
	s :: Not even you, mortal.
	i :: yeah !!
	i :: we were all accused of guilt for being nonstandard
	i :: being abnormal shouldn't be a crime !!
	i :: and killing shouldn't be the punishment :C
	i :: ....
	i :: we should kill the council in revenge !!!! :D
	n :: ...
	n :: wow.
	n :: you'd do this all for me? proclaim yourselves guilty, and fight the Deometric Council?
	s :: \"All the more clout for us,\" as they say.
	i :: literally nobody says that :V
	n :: then let's do this.
	n :: mortal, this is a shot in the dark, but...
	n :: come with us?
	"""
