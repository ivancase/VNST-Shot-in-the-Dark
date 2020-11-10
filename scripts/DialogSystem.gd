extends Control

signal next

var icosa
var sphere
var narrator

func _ready():
	icosa = get_node("Icosahedron")
	sphere = get_node("Sphere")
	narrator = get_node("Narrator")
	
	play_dialogue([
	[sphere, "Hello."], 
	[icosa, "hey !!"],
	[icosa, "can you give me an example ..."],
	[icosa, "of a more complex dialogue ????"],
	[sphere, "Ironic that you ask. You've just demonstrated one yourself."],
	[icosa, ":O"]])
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		emit_signal("next")

func play_dialogue(dialogue):
	#dialogue e.g. [[sphere, "Hello."], [icosa, "hey !!"]]
	for lineinfo in dialogue:
		var actor = lineinfo[0]
		var line = lineinfo[1]
		actor.show()
		actor.act(line)
		yield(self, "next")
		actor.hide()
