extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Master.value = db2linear(AudioServer.get_bus_volume_db(0))
	$VBoxContainer/Music.value = db2linear(AudioServer.get_bus_volume_db(0))
	$VBoxContainer/SFX.value = db2linear(AudioServer.get_bus_volume_db(0))

func _on_Confirm_pressed():
	pass # Replace with function body.


func _on_SFX_mouse_exited():
	pass # Replace with function body.


func _on_Music_mouse_exited():
	pass # Replace with function body.


func _on_Master_mouse_exited():
	pass # Replace with function body.
