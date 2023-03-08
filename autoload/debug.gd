extends WindowDialog

func _process(delta):
	if Input.is_action_just_pressed("open_debug"):
		if visible == false:
			popup()
		else:
			visible = false


func _on_Button_pressed():
	SaveManager.clear_data()
