extends Control

signal next

var icosa
var sphere
var narrator

func _ready():
	icosa = get_node("Icosahedron")
	sphere = get_node("Sphere")
	narrator = get_node("Narrator")

	var key = {"i" : icosa, "s" : sphere, "n" : narrator}

	play_dialogue(_parse_script(key, 
	"n ; welcome to my very rough draft of Shot in the Dark. press space to advance text. ::" +
	"n ; i pretty much just have a dialogue system working, and choices aren't yet in a workable state. ::" +
	"n ; nonetheless, let's see how a scene might play out in the finished product! ::" +
	"s ; I'd like to ask you not to shoot me. ::" +
	"s ; You'd ruin my immaculate, spherical form. ::" +
	"i ; i extend the emotion but less creepy !! and about my lovely, icosahedral shape :)) ::" +
	"i ; seriously ,,, i didn't kill you !!!!!! ::" +
	"i ; i've killed a loooooooot of mortals ... but not you ! ::" +
	"n ; these demons don't seem very trustworthy. ::" +
	"s ; I could not have killed you. I've been busy studying my shape for the last four millenia. ::" +
	"s ; I would not be surprised if the jagged faux-round excuse for a prism across from me did it. ::" +
	"i ; ... :(( ::" +
	"n ; wow, what a crazy set of characters. truly riveting. ::" +
	"n ; tune in after future updates to see where this wacky story goes!!!! ::" +
	"n ; i didn't program an ending so the next time you press space i will disappear and you can consider this game over. bye bye!!"
	))
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		emit_signal("next")
		
func _parse_script(key, script):
	var lines = script.strip_edges().split("::")
	
	var dialogue = []
	for line in lines:
		var lineinfo = line.strip_edges().split(";")
		var actor = key[lineinfo[0].strip_edges()]
		var text = lineinfo[1].strip_edges()
		dialogue.append([actor, text])
	return dialogue

func play_dialogue(dialogue):
	#dialogue e.g. [[sphere, "Hello."], [icosa, "hey !!"]]
	for lineinfo in dialogue:
		var actor = lineinfo[0]
		var text = lineinfo[1]
		actor.enter_limelight()
		actor.act(text)
		yield(self, "next")
		actor.exit_limelight()
