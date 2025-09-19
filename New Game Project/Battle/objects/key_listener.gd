extends Sprite2D

@onready var falling_key = preload("res://Battle/objects/falling_key.tscn")
@onready var score_text = preload("res://Battle/objects/score_press_text.tscn")
@export var key_name: String = ""

var falling_key_queue = []

# If distance_from_pass is less than threshold, give that score
var perfect_press_threshold: float = 30
var great_press_threshold: float = 50
var good_press_threshold: float = 60
var ok_press_threshold: float = 80
# otherwise, miss

var perfect_press_score: int = 250
var great_press_score: int = 100
var good_press_score: int = 50
var ok_press_score: int = 20

var missed_key: int = 10   # max missed notes before failing

var failed_notes: int = 0

func _ready():
	$GlowOverlay.frame = frame + 4
	Signals.CreateFallingKey.connect(CreateFallingKey)


func _process(delta):
	if Input.is_action_just_pressed(key_name):
		Signals.KeyListenerPress.emit(key_name, frame)

	# Only process if keys exist
	if falling_key_queue.size() > 0 and falling_key_queue.front():
		
		# Check if note has passed (missed)
		if falling_key_queue.front().has_passed:
			failed_notes += 1
			
			falling_key_queue.pop_front()
			
			# PRINT MISS
			var st_inst = score_text.instantiate()
			get_tree().get_root().call_deferred("add_child", st_inst)
			st_inst.SetTextInfo("MISS")
			st_inst.global_position = global_position + Vector2(0, -20)
			Signals.ResetCombo.emit()
		
		# Check fail condition
		if failed_notes >= missed_key:
			get_tree().call_deferred("change_scene_to_file", "res://Scenes/Menus/death_to_you.tscn")
		
		# Handle player pressing key
		if Input.is_action_just_pressed(key_name):
			var key_to_pop = falling_key_queue.pop_front()
			
			if key_to_pop:
				var distance_from_pass = abs(key_to_pop.pass_threshold - key_to_pop.global_position.y)
				
				$AnimationPlayer.stop()
				$AnimationPlayer.play("key_hit")
				
				var press_score_text: String = ""
				if distance_from_pass < perfect_press_threshold:
					Signals.IncrementScore.emit(perfect_press_score)
					press_score_text = "PERFECT"
					Signals.IncrementCombo.emit()
				elif distance_from_pass < great_press_threshold:
					Signals.IncrementScore.emit(great_press_score)
					press_score_text = "GREAT"
					Signals.IncrementCombo.emit()
				elif distance_from_pass < good_press_threshold:
					Signals.IncrementScore.emit(good_press_score)
					press_score_text = "GOOD"
					Signals.IncrementCombo.emit()
				elif distance_from_pass < ok_press_threshold:
					Signals.IncrementScore.emit(ok_press_score)
					press_score_text = "OK"
					Signals.IncrementCombo.emit()
				else:
					# Wrong timing → just a MISS (no extra fail increment here)
					press_score_text = "MISS"
					Signals.ResetCombo.emit()
				
				key_to_pop.queue_free()
				
				var st_inst = score_text.instantiate()
				get_tree().get_root().call_deferred("add_child", st_inst)
				st_inst.SetTextInfo(press_score_text)
				st_inst.global_position = global_position + Vector2(0, -20)


func CreateFallingKey(button_name: String):
	if button_name == key_name:
		var fk_inst = falling_key.instantiate()
		get_tree().get_root().call_deferred("add_child", fk_inst)
		fk_inst.Setup(position.x, frame + 4)
		falling_key_queue.push_back(fk_inst)


func _on_random_spawn_timer_timeout():
	$RandomSpawnTimer.wait_time = randf_range(0.4, 3)
	$RandomSpawnTimer.start()
