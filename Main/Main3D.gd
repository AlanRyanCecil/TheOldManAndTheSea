extends Spatial


onready var change_scene = $SceneChanger/AnimationPlayer

func _ready():
	yield(get_tree().create_timer(3), "timeout")
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	

func scene_change():
	change_scene.play("fade")
	yield(change_scene, "animation_finished")
	get_tree().change_scene("res://Main/Main2D.tscn")
