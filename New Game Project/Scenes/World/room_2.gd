extends Node2D

func _process(delta):
	change_scene()

func _on_room_2_entrance_body_entered(body):
	if body.has_method("Player"):
		Global.transition_scene = true


func _on_room_2_entrance_body_exited(body):
	if body.has_method("Player"):
		Global.transition_scene = false

func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == "room_2":
			get_tree().change_scene_to_file("res://Scenes/World/world.tscn")
			Global.finish_changescenes()
