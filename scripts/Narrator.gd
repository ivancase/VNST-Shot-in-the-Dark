extends "res://scripts/Actor.gd"

var box

func _ready():
	shootable = false
	
	box = body.get_node("box")
	
	body.connect("mouse_entered", self, "_on_mouse_enter")
	body.connect("mouse_exited", self, "_on_mouse_exit")

func _on_mouse_enter():
	if !shootable:
		return
	
	box.color = Color("c8be4a2f")
	get_parent().target = self

func _on_mouse_exit():
	if !shootable:
		return
	
	box.color = Color("c8000000")
	get_parent().target = null

func _onready():
	text = body.get_node("text")
		
	exit_limelight()
	
func die():
	mouse_over = false
	shootable = false
	
	voice.stream = load("res://sounds/death.wav")
	voice.volume_db -= 10
	voice.play()
	
	tween = Tween.new()
	add_child(tween)
	
	tween.interpolate_property(body, "rect_position", body.rect_position, body.rect_position + Vector2(0, 800), 1, Tween.TRANS_LINEAR)
	tween.start()
	yield(tween, "tween_completed")
	
	yield(fade_out(5), "completed")
	
	get_tree().change_scene(next_scene)

func enter_limelight():
	show()
	
func exit_limelight():
	hide()
