extends "res://scripts/Intro.gd"

var billing

func _on_ready():
	key = {"n" : narrator}
	Global.INTERIM_OCCURED = true
	
	billing = get_node("Billing")
	clock.next_scene = Global.CURRENT_SCENE
	billing.bbcode_text = "[center][shake]" + Global.TRIAL_NAME
	end()

func end():
	clock.enter_limelight()
	
	if clock.time != Global.CLOCK_TIME:
		timer.wait_time = 1
		timer.start()
		yield(timer, "timeout")
		clock.set_time(Global.CLOCK_TIME)
	
	clock.shootable = true
	if clock.mouse_over:
		clock._on_mouse_enter()
	
	#yield(play_dialogue(parse_script(OVER)), "completed")

const OVER = """
	n :: shoot the clock whenever you're ready.
	"""
