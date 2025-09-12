extends StaticBody2D

@onready var interactable: Area2D = $Interactable

const lines: Array[String] = [
	"Whats goody gangsta!",
	"This is a test for the dialogue system",
	"If you're seeing this...",
	"It works!"
]

func _ready() -> void:
	$AnimatedSprite2D.play("idle")
	interactable.interact = _on_interact
	
func _on_interact():
	DialogueManager.start_display(global_position, lines)
	await DialogueManager.dialog_finished
