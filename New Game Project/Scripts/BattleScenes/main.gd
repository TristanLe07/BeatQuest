extends Node

const CHARACTER_START_POSITION := Vector2i(150, 485)
const CAM_START_POS := Vector2i(576, 324)

var speed : float
const START_SPEED : float = 10.0
const MAX_SPEED : int = 25

func _ready():
	pass
	
func new_game():
	$Character.position = CHARACTER_START_POSITION
	$Character.velocity = Vector2i(0, 0)
	$Camera2D.position = CAM_START_POS
	$Ground.position = Vector2i(0, 0)
	
	
func _process(delta):
	pass
