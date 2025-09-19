extends Node2D

func _process(delta):
	change_scene()

func _on_room_2_entrance_body_entered(body):
	print("entered1")
	if body is Player:
		print("entered2")
		Global.transition_scene = true


func _on_room_2_entrance_body_exited(body):
	print("exited1")
	if body is Player:
		print("exited2")
		Global.transition_scene = false

func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == "world":
			get_tree().change_scene_to_file("res://Scenes/World/room_2.tscn")
			Global.finish_changescenes()
