extends ColorRect

onready var tween = get_node("Tween")

onready var palette = [Color("d87644"), Color("e43b44"), Color("f77622"), Color("fee761"),
					Color("63c74d"), Color("3e8948"), Color("0095e9"), Color("feae34"),
					Color("ff0044"), Color("68386c"), Color("b55088"), Color("f6757a"),
					Color("ffffff")]

export (float) var duration = 1.0
export (bool) var special_color

var enabled = true
var prev_color
var next_color

func _ready():
	if special_color:
		prev_color = color
	else:
		prev_color = palette[randi() % palette.size()]
		
	next_color = palette[randi() % palette.size()]
	while next_color == prev_color:
		next_color = palette[randi() % palette.size()]
	
	while enabled:
		tween.interpolate_property(self, "color", prev_color, next_color, duration)
		tween.start()
		yield(tween, "tween_completed")
		
		prev_color = next_color
		next_color = palette[randi() % palette.size()]
		while next_color == prev_color:
			next_color = palette[randi() % palette.size()]

#func _clrf():
#	return clamp(randf(), 0.3, 1)
