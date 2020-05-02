extends RigidBody

var broken = false
var spin = 7
func _on_Crate__body_entered(body):
	if body.name == 'Player3D' and not broken:
		$AudioStreamPlayer3D.play()
		broken = true
		set_axis_velocity(Vector3.UP * 5)
		add_torque(Vector3(spin, spin, 0))
		$Timer.start()


func _on_Timer_timeout():
	$AnimationPlayer.play("shrink")
