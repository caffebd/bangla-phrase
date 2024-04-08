extends Node2D

var music_playing: bool = false

var selected_track = "track1"

func play_music(music):
	$"%AudioStreamPlayer".stream = SharedVariables.background_audio[music]
	$"%AudioStreamPlayer".play()

func stop_music():
	$"%AudioStreamPlayer".stop()

func music_toggle(state):
	music_playing = state
	if music_playing:
		play_music(selected_track)
	else:
		stop_music()
