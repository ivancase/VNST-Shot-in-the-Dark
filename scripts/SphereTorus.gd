extends "res://scripts/DialogSystem.gd"

onready var sphere = get_node("Sphere")
onready var torus = get_node("Set of Toruses")
onready var narrator = get_node("Narrator")
onready var exonecute_text = get_node("Exonecute Text")
onready var color_shift = get_node("Color Shift")

func _ready():
	key = {"s" : sphere, "t" : torus, "n" : narrator}
	
	var choices = ["You know each other?", "Why so loyal to the law?"]
	var scripts = [KNOW, LOYAL]
	assert(len(choices) == len(scripts), "Choices must correspond to a script.")
	
	choicebox.populate(choices)
	
	direct_scene(parse_script(INTRO), scripts)
		
	
func end():
	exonecute_text.show()
	color_shift.duration /= 2
	yield(play_dialogue(parse_script(TIMES_UP)), "completed")
		
const INTRO = """
	n :: okay. here's the last two.
 	t :: WE ARE THE SET OF TORUSES. WE DID NOT KILL YOU.
	t :: IT IS YOUR LEGAL DUTY TO EXONECUTE US IMMEDIATELY.
	s :: ...
	t :: OH BOY. IT'S THIS DEMON.
	n :: holy clockamole you're *not* supposed to talk yet.
	"""
	
const KNOW = """
	s :: I've had the displeasure of trying to do *business* with this demon.
	s :: They're the reason the Council wants me gone, I bet.
	t :: CURIOUS.
	t :: I THOUGHT IT WAS BECAUSE YOU KILLED THIS MORTAL.
	t :: IT WOULD BE PATHETIC IF YOU WERE LYING ABOUT THAT, TOO.
	s :: I never said I didn't. But you reported me to the Council.
	s :: When I tried to *help* you.
	t :: ~TOP TORUS SAYS:~
	t :: I reported you because your tacky pop ups violate aesthetic code J-03LG.
	t :: ~RIGHT TORUS SAYS:~
	t :: Watch it, Top. You're violating code M4N-N3RS.
	t :: ~LEFT TORUS SAYS:~
	t :: That's not a real code. You can't just do that!
	s :: ...
	s :: That's why you reported me?
	s :: That's why the last century has been a living *hell* for me?
	s :: Because you don't like my *aesthetic*???
	t :: YOUR APPEARANCE IS A VIOLATION.
	t :: OF THE LAW AND OF MY EYES.
	n :: ugh. i hate demon drama. this isn't leading anywhere.
	"""
	
const LOYAL = """
	n :: the mortal has a point here, set of toruses.
	n :: the law's the whole reason you're going to die tonight.
	t :: THAT IS NOT MY POSITION TO JUDGE. NOR YOURS, CLOCK-SETTER.
	t :: WE WERE ONCE THREE.
	t :: THE LAW BONDED US TOGETHER AS ONE. WE *ARE* ACCORDANCE WITH THE LAW.
	t :: IF THE LAW CHOOSES TO REMOVE US, THEN THAT IS TO BE.
	s :: Easy for you to say. You've no choice in the matter.
	t :: NEITHER DO YOU, SPHERE.
	s :: Not now that I'm here. But before this mortal's death, I knew freedom.
	s :: I knew financial success. I broke the law to get it. That's how they'll remember me.
	s :: Like a proper Sphere.
	t :: YOU DISGUST US.
	t :: YOU ARE NO PROPER SPHERE, AS MUCH AS YOU DELUDE YOURSELF.
	s :: What? How did you...
	t :: A PROPER SPHERE WOULD BE GRANTED POWER BY THE LAW. WOULD RULE WITH IT.
	t :: IT'S A PITY YOU TURNED OUT THE WAY YOU DID.
	t :: YOU COULD HAVE BEEN A GOVERNOR. A LORD. A REGENT.
	t :: INSTEAD YOU'VE MADE YOURSELF A BULLSHIT, TWO-BIT \"INVESTOR\".
	t :: AND WILL DIE A CRIMINAL.
	t :: A FATE MORE BEFITTING A SHAPE OF LESSER DIMENSION.
	s :: ...
	"""
	
const TIMES_UP = """
	n :: ok. time's up. maybe just close your eyes and shoot randomly.
	t :: INADVISABLE. IT IS YOUR LEGAL DUTY TO SHOOT US.
	"""
	
