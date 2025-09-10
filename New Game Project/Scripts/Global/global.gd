extends Node

var current_scene = "world" #MAIN AREA I THINK
var transition_scene = false

var player_exit_main_posx = 216
var player_exit_main_posy = 72
var player_start_posx = 300
var player_start_posy = 100

var game_first_loading = true

func finish_changescenes():
	print(transition_scene)
	if transition_scene == true:
		transition_scene = false
		print(transition_scene)
		if current_scene == "world":
			current_scene = "Room2"
		else:
			print("why is the scene changing back to world")
			current_scene = "world"
