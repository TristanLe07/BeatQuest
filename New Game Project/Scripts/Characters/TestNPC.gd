extends StaticBody2D

@onready var interactable: Area2D = $Interactable


const lines: Array[String] = [
	"Holy moly!",
	"You found me!",
	"I dont know how I got here... but I did!",
	"Thanks for finding me, I'm not going to give you anything."
]

func _ready() -> void:
	$AnimatedSprite2D.play("idle")
	interactable.interact = _on_interact
	
func _on_interact():
	Global.current_level = "RAINCLOUDS"
	DialogueManager.start_display(global_position, lines)
	await DialogueManager.dialog_finished
	get_tree().change_scene_to_file("res://Battle/levels/game_level.tscn")
