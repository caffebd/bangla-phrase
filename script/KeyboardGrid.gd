extends GridContainer

const keyboard_key = preload("res://scenes/KeyboardKey.tscn")

func _ready():
	pass
#	GlobalSignals.connect("next_guess", self, "_next_guess")


func place_all_keys(word:String):
	var word_data = SharedVariables.all_levels[SharedVariables.current_level]
	for letter in word_data[word]["keyboard"]:
		set_up_keyboard_key(letter)
	show_keyboard(false)

func set_up_keyboard_key(letter: String):
	print ("keyboard letter "+letter)
	var key = keyboard_key.instance()
	key.set_normal_texture(SharedVariables.keyboard_letters[letter])
	key.my_letter = letter
	add_child(key)

#func _next_guess():
#	show_keyboard(false)	

func show_keyboard(state: bool):
	get_parent().visible = state
