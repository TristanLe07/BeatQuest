extends Node

var current_scene = "world" #MAIN AREA I THINK
var transition_scene = false

var player_exit_main_posx = 16
var player_exit_main_posy = 54
var player_start_posx = 450
var player_start_posy = 56

var game_first_loading = true

func finish_changescenes():
	print(transition_scene)
	if transition_scene == true:
		transition_scene = false
		print(transition_scene)
		if current_scene == "world":
			current_scene = "Room2"
		else:
			current_scene = "world"
