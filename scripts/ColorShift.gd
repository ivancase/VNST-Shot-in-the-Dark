extends ColorRect

onready var tween = get_node("Tween")

export (float) var duration = 1.0
export (bool) var special_color

var enabled = true
var prev_color
var next_color

func _ready():
	if special_color:
		prev_color = color
	else:
		prev_color = Color(_clrf(), _clrf(), _clrf(), 1)
	next_color = Color(_clrf(), _clrf(), _clrf(), 1)
	while enabled:
		tween.interpolate_property(self, "color", prev_color, next_color, duration)
		tween.start()
		yield(tween, "tween_completed")
		
		prev_color = next_color
		next_color = Color(_clrf(), _clrf(), _clrf(), 1)

func _clrf():
	return clamp(randf(), 0.3, 1)
