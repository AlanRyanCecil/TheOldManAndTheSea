extends CanvasLayer


func _input(event):
	if Input.is_action_pressed("pause"):
		get_tree().paused = !get_tree().paused
		toggle_pause_menu()
		
func toggle_pause_menu():
	if get_tree().paused:
		$Popup.show()
	else:
		$Popup.hide()
