extends "res://scripts/DialogSystem.gd"

onready var narrator = get_node("Narrator")

func end():
	if Global.all_convicted():
		get_tree().change_scene("res://scenes/Finale.tscn")
	else:
		get_tree().change_scene("res://scenes/Restart.tscn")
	
func direct_scene(intro, _scripts):
	fade_in()
	yield(play_dialogue(intro), "completed")
	end()
