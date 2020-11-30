extends Button


var choicebox
var should_show

func _ready():
	choicebox = get_parent().get_parent()

func assign_index(index):
	connect("pressed", choicebox, "_set_choice", [index])
