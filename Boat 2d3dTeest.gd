extends KinematicBody

var x_input = 0;
var motion = Vector3.ZERO
const SPEED = 10

func _physics_process(delta):
	x_input = Input.get_action_strength('right') - Input.get_action_strength("left");
	motion.x = x_input * SPEED
	motion = move_and_slide(motion, Vector3.UP)
