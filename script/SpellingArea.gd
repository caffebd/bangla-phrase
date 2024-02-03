extends TextureRect

var my_letter = ""

func set_letter(letter: String):
	texture = SharedVariables.letter_images[letter]
