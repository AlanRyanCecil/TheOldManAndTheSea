extends KinematicBody2D

const GRAVITY = 0
const UP = Vector2.UP
const SPEED = 600
const FRICTION = 0.1
var x_input
var y_input
var motion = Vector2.ZERO
var time = 0

func _physics_process(delta):
	time += 0.01
	waves()
	conrtolPlayer()
	move_and_slide(motion, UP)


func conrtolPlayer():
	motion.y += GRAVITY
	x_input = Input.get_action_strength('right') - Input.get_action_strength('left')
	motion.x = x_input * SPEED


func waves():
	var change = sin(time * 2) * 32
	motion.y = change
	rotation = change / 1200
