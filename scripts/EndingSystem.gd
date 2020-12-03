extends "res://scripts/DialogSystem.gd"

onready var narrator = get_node("Narrator")
onready var execute_text = get_node("Execute Text")

func end():
	pass
	
func make_shootable():
	pass

func direct_scene(intro, _scripts):
	fade_in()
	music.play()
	yield(play_dialogue(intro), "completed")
	make_shootable()
	execute_text.show()
	end()
