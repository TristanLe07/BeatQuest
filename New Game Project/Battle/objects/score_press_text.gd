extends Control

# perfect ffbe00
# great e2dd25
# good a7dd25
# ok 8dbfc7
# miss 5a5758


func SetTextInfo(text: String):
	$ScoreLevelText.text = "[center]" + text
	
	match text:
		"PERFECT":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("ffbe00"))
		"GREAT":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("e2dd25"))
		"GOOD":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("e2dd25"))
		"OK":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("8dbfc7"))
		_:
			$ScoreLevelText.set("theme_override_colors/default_color", Color("5a5758"))
