extends Node2D


onready var Sea = load("res://Scenes/environment/Sea.tscn")

onready var Player = $Player
onready var timer = $Timer
const seaWidth = 3840
const blockStart = 1600
const blockWidth = 100
var waters = []
var blocks = []


func addSea(x):
	var sea = Sea.instance()
	waters.append(sea)
	sea.set_position(Vector2(x, 0))
	add_child(sea)


func _ready():
	$Storm.emitting  = true
