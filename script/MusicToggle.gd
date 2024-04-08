extends TextureButton


func _on_MusicToggle_toggled(button_pressed):
	GameMusic.music_toggle(button_pressed)
