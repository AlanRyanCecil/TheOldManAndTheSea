extends ParallaxBackground


func _process(delta):
	$SkyLayer.motion_offset.x -= 0.2
