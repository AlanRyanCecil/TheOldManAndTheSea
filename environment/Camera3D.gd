extends Camera

var mouse_sensivivity = 1200
var look_target = Vector3.ZERO
var updown_rotation = Vector3.ZERO
var leftright_rotation = Vector3.ZERO

onready var Player = get_parent()

func _input(event):
	if event is InputEventMouseMotion:
		leftright_rotation.y = Player.get_rotation().y - event.relative.x / mouse_sensivivity
		Player.set_rotation(leftright_rotation)

		updown_rotation.x = get_rotation().x - event.relative.y / mouse_sensivivity
		updown_rotation.x = clamp(updown_rotation.x, -PI/12, PI/12)
		set_rotation(updown_rotation)
