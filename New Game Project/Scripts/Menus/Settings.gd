extends Control


func _ready():
	pass


func _on_Confirm_pressed():
	AudioServer.set_bus_volume_db(0, linear_to_db($AudioSettings/VBoxContainer/Master.value))
	AudioServer.set_bus_volume_db(1, linear_to_db($AudioSettings/VBoxContainer/Music.value))
	AudioServer.set_bus_volume_db(2, linear_to_db($AudioSettings/VBoxContainer/SFX.value))
	get_tree().change_scene_to_file("res://Scenes/Menus/MainMenu.tscn")
