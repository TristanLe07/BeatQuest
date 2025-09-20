extends Control

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		pause_or_unpause()
		
func pause_or_unpause():
	if get_tree().paused == true:
		$".".hide()
		get_tree().paused = false
	elif get_tree().paused == false:
		$".".show()
		get_tree().paused = true


func _on_main_menu_btn_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Menus/MainMenu.tscn")
