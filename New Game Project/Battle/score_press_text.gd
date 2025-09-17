extends Control

#perfect ffe100
#great 95ff00
#good 7fdb00
#ok 5aecff
#miss e50000

func SetTextInfo(text: String):
	$ScoreLevelText.text = "[center]" + text
	
	match text:
		"PERFECT":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("ffe100"))
		"GREAT":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("95ff00"))
		"GOOD":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("7fdb00"))
		"OK":
			$ScoreLevelText.set("theme_override_colors/default_color", Color("5aecff"))
		_:
			$ScoreLevelText.set("theme_override_colors/default_color", Color("e50000"))
		
