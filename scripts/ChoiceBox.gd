extends Node2D

signal choice

var buttons
var choice

func _ready():
	buttons = get_node("buttons").get_children()
	var index = 0
	for b in buttons:
		b.assign_index(index)
		b.hide()
		index += 1
	hide()
	
func _set_choice(index):
	choice = index
	emit_signal("choice")
	
func any_enabled():
	for b in buttons:
		if !b.disabled:
			return true
	return false
	
func disable(index):
	buttons[index].disabled = true
	
func get_choice():
	return choice
	
func populate(choices):
	var index = 0
	for b in buttons:
		if index == len(choices):
			return
		b.text = choices[index]
		b.disabled = false
		b.should_show = true
		index += 1
		
func show():
	for b in buttons:
		if b.should_show:
			b.show()
	.show()

func hide():
	for b in buttons:
		b.hide()
	.hide()
