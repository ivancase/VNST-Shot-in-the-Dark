extends Node

onready var muted = false
onready var music = false

onready var INTERIM_OCCURED = false

onready var ICOSAHEDRON_CONVICTED = false
onready var SPHERE_CONVICTED = false
onready var TORUS_CONVICTED = false
onready var PYRAMID_CONVICTED = false

var CURRENT_SCENE
var TRIAL_NAME
var CLOCK_TIME

func amt_convicted():
	return int(ICOSAHEDRON_CONVICTED) + int(SPHERE_CONVICTED) + int(TORUS_CONVICTED) + int(PYRAMID_CONVICTED)

func _input(event):
	if event.is_action_pressed("mute_global"):
		muted = !muted
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), muted)
	if event.is_action_pressed("mute_music"):
		music = !music
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), music)
