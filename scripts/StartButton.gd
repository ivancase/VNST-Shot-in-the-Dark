extends RichTextLabel

func _ready():
	connect("mouse_entered", self, "_on_mouse_enter")
	connect("mouse_exited", self, "_on_mouse_exit")

func _on_mouse_enter():
	if !get_parent().loading:
		get_parent().target = self
		bbcode_text = "\n[color=#be4a2f][center]shot in the dark."
	
func _on_mouse_exit():
	if !get_parent().loading:
		get_parent().target = null
		bbcode_text = "\n[center]shot in the dark."
