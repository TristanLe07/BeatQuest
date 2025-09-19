extends Node2D

func _ready():
	if Global.game_first_loading == true:
		$Player.position.x = Global.player_start_posx
		$Player.position.y = Global.player_start_posy
	else:
		$Player.position.x = Global.player_exit_main_posx
		$Player.position.y = Global.player_exit_main_posy
	
func _process(delta):
	change_scene()
	
func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == "world":
			Global.game_first_loading = false
			Global.finish_changescenes()
			get_tree().change_scene_to_file("res://Scenes/World/room_2.tscn")



func _on_room_2_entrance_body_exited(body):
	if body is Player:
		Global.transition_scene = false

func _on_room_2_entrance_body_entered(body):
	if body is Player:
		Global.transition_scene = true
