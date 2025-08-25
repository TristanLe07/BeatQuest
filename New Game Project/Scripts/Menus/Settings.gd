extends Control


func _ready():
	pass


func _on_Confirm_pressed():
	AudioServer.set_bus_volume_db(0, linear2db($AudioSettings/VBoxContainer/Master.value))
	AudioServer.set_bus_volume_db(1, linear2db($AudioSettings/VBoxContainer/Music.value))
	AudioServer.set_bus_volume_db(2, linear2db($AudioSettings/VBoxContainer/SFX.value))
	get_tree().change_scene("res://Scenes/Menus/MainMenu.tscn")
