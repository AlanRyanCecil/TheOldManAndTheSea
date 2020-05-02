extends Node


#func _ready():
var wave_count = 20
var frequency = 60
var motion_scaler = Vector2(1.0 / wave_count, 1.0 / wave_count)
const waves = preload("res://Sea/ParallaxSea.tscn")
var wave
var waveTexture
var waveLayer


func _ready():
#	waves.get_child(0).motion_scale = motion_scaler
	make_waves()


func make_waves():
	for w in range(1, wave_count):
		wave = waves.instance()
		wave.layer += w
		waveLayer =  wave.get_node("ParallaxLayer")
		waveTexture =  wave.get_node("ParallaxLayer/TextureRect")
		waveTexture.rect_position.y += frequency * w + pow(w, 2.5)
		waveLayer.motion_scale = w * motion_scaler
		var LabelCont = wave.get_node("ParallaxLayer/VBoxContainer")
		LabelCont.rect_position.y += waveTexture.rect_position.y
		LabelCont.get_child(0).text = str(w)
		add_child(wave)
