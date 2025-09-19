extends StaticBody2D

@onready var interactable: Area2D = $Interactable


const lines: Array[String] = [
	"Whats goody gangsta! (Press 'Enter' to continue)",
	"This game isnt finished",
	"I have no idea what the dialogue will end up being",
	"Anyways, after you read this and press enter you will be sent to the BATTLE ROOM... Good Luck!"
]

func _ready() -> void:
	$AnimatedSprite2D.play("idle")
	interactable.interact = _on_interact
	
func _on_interact():
	DialogueManager.start_display(global_position, lines)
	await DialogueManager.dialog_finished
	Global.current_level = "RHYTHM_HELL"
	get_tree().change_scene_to_file("res://Battle/levels/game_level.tscn")
