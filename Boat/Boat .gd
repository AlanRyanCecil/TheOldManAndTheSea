extends RigidBody



func _on_Boat__body_entered(body):
	if body.name == 'Player3D':
		get_tree().call_group('Main', 'scene_change')
