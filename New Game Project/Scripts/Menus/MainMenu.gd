extends Control

class_name MainMenu

func _ready():
	AudioPlayer.play_music_level()

func _on_PlayButton_pressed():
	get_tree().change_scene_to_file("res://Scenes/World/room_1.tscn")


func _on_SettingsButton_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/Settings.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()
