extends TextureButton

var my_letter: String = ""


func _pressed():
	GlobalSignals.emit_signal("keyboard_key_press", my_letter)
