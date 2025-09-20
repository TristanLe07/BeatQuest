extends Node2D
#
#func _ready():	
	#if Global.game_first_loading == true:
		#$Player.position.x = Global.player_start_posx
		#$Player.position.y = Global.player_start_posy
	#else:
		#$Player.position.x = Global.player_exit_main_posx
		#$Player.position.y = Global.player_exit_main_posy
	
func _process(delta):
	change_scene()
	
func change_scene():
	if Global.transition_scene == true:
		if Global.current_scene == "Room2":
			Global.finish_changescenes()
			Global.game_first_loading = false
			get_tree().change_scene_to_file("res://Scenes/World/room_1.tscn")


func _on_area_2d_body_entered(body):
	if body is Player:
		Global.transition_scene = true


func _on_area_2d_body_exited(body):
	if body is Player:
		Global.transition_scene = false
