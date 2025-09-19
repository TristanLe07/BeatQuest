extends Node2D

func _ready():
	$AnimationPlayer.play("Test")

func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://Scenes/World/room_1.tscn")
