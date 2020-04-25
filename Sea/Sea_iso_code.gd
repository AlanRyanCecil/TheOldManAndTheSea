extends ParallaxBackground

var frequency = 80

func _ready():
	var waves = $Waves
	var wave
	var waveTexture
	for w in range(1, 20):
		wave = waves.duplicate()
		waveTexture = wave.get_child(0)
		waveTexture.rect_position.y += frequency * w
		wave.motion_scale.x += w * 0.05
		add_child(wave)
		
	
