extends Control

var score: int = 0
var combo_count: int = 0

func _ready():
	Signals.IncrementScore.connect(IncrementScore)
	Signals.IncrementCombo.connect(IncrementCombo)
	Signals.ResetCombo.connect(ResetCombo)
	
	ResetCombo()
	
func IncrementScore(incr: int):
	score += incr
	$CanvasLayer/ScoreLabel.text = str(score) + " pts"
	
func IncrementCombo(incr: int):
	combo_count += 1
	$CanvasLayer/ComboLabel.text = ""

func ResetCombo():
	combo_count = 0
	$CanvasLayer/ComboLabel.text = ""
	
