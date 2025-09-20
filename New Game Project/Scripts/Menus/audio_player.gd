extends AudioStreamPlayer

const level_music = preload ("res://Assets/Audio/peaceful relaxing music.mp3")

func _play_music(music: AudioStream, volume = 0.0):
	$".".play()
	if stream == music:
		return
		
	stream = music
	volume_db = volume

	
func play_music_level():
	_play_music(level_music)
