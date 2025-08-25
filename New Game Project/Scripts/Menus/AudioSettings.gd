extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Master.value = db2linear(AudioServer.get_bus_volume_db(0))
	$VBoxContainer/Music.value = db2linear(AudioServer.get_bus_volume_db(1))
	$VBoxContainer/SFX.value = db2linear(AudioServer.get_bus_volume_db(2))

func _on_Confirm_pressed():
	release_focus()


func _on_SFX_mouse_exited():
	release_focus()

func _on_Music_mouse_exited():
	release_focus()

func _on_Master_mouse_exited():
	release_focus()
