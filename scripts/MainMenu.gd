extends Control

onready var text = get_node("text")
onready var shoot_sound = get_node("Shoot")
onready var ding = get_node("ding")
onready var white = get_node("white")
onready var white2 = get_node("white2")
onready var tween = get_node("Tween")

var target
var loading

func _input(event):
	if !loading and event.is_action_pressed("shoot"):
		shoot()

func shoot():
	var shot = target
	shoot_sound.play()
	
	var flash_time = 1
	white.show()
	
	tween.interpolate_property(white, "color", Color(1, 1, 1, 1), Color(1, 1, 1, 0), flash_time, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()
	
	if shot == text:
		loading = true
		ding.play()
		
		tween = Tween.new()
		add_child(tween)
		
		white2.show()
		tween.interpolate_property(white2, "color", Color(0, 0, 0, 0), Color(0, 0, 0, 1), 2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		tween.start()
		yield(tween, "tween_completed")
		
		get_tree().change_scene("res://scenes/Intro.tscn")
