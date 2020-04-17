extends KinematicBody

const SPEED = 20
const ROT_SPEED = 0.2

onready var playerBody = $Cone

const UP = Vector3.UP
var direction = Vector3.ZERO
var motion = Vector3.ZERO
func _physics_process(delta):
	direction = get_direction()
	face_forward(direction)
	motion = walk_forward(direction)
	motion = move_and_slide(motion, UP)


var xz = Vector3.ZERO
func get_direction():
	xz.x = Input.get_action_strength('right') - Input.get_action_strength('left')
	xz.z = Input.get_action_strength('backward') - Input.get_action_strength("forward")
	return xz


func walk_forward(direction):
	var walk = direction.normalized() * SPEED
	var forward = Vector3.ZERO
	var xbasis = get_transform().basis

	# Primary influence
	forward.x += walk.x * xbasis.x.x
	forward.z += walk.z * xbasis.z.z
	# Secondary influence
	forward.x += walk.z * xbasis.z.x
	forward.z += walk.x * xbasis.x.z
	return forward


var clamp_range = PI/2
func face_forward(direction):
	var rot = -direction.x * ROT_SPEED
	if not rot:
		rot = -playerBody.rotation.y / PI
	if direction.x and direction.z:
		clamp_range = clamp(clamp_range - ROT_SPEED, PI/4, PI/2)
	else:
		clamp_range = PI/2
	playerBody.rotation.y = clamp(playerBody.rotation.y + rot, -clamp_range, clamp_range)


#func _enter_tree():
#	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
#
#func _exit_tree():
#	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
