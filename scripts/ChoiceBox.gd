extends Control

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
	
func get_choice():
	return choice
	
func populate(choices):
	var index = 0
	for label in choices:
		buttons[index].text = label
		buttons[index].show()
		index += 1

func hide():
	for b in buttons:
		b.hide()
	.hide()
