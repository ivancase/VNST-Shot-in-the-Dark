extends Node

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
