extends PanelContainer

onready var spelling_grid: GridContainer = $SpellingGrid
onready var main_parent = $".."

const letter_block = preload("res://scenes/SpellingArea.tscn")
const letter_spacer = preload("res://scenes/Spacer.tscn")


var empty_space = 0

func _ready():
	GlobalSignals.connect("keyboard_key_press", self, "_place_letter")
	GlobalSignals.connect("submit_answer", self, "_check_answer")
	GlobalSignals.connect("delete_letter", self, "_delete_letter")
	

func get_word_length(word:String):
	var word_data = SharedVariables.all_levels[SharedVariables.current_level]
	var word_length = word_data[word]["spelling"].size()
	SharedVariables.target_word_length = word_length
	setup_spelling_grid(word_length, word)
	

func setup_spelling_grid(letter_count: int, word: String):
	var word_data = SharedVariables.all_levels[SharedVariables.current_level]
	for letter in word_data[word]["spelling"]:
		if letter == "*":
			var spacer = letter_spacer.instance()
			spelling_grid.add_child(spacer)
		else:
			var block = letter_block.instance()
			spelling_grid.add_child(block)
#	yield(get_tree().create_timer(0.1), "timeout")
	if letter_count > 8:
		yield(get_tree(),"idle_frame")
		rect_scale = Vector2(0.75, 0.75)
		rect_pivot_offset = Vector2(rect_size/2)	
		




func _place_letter(key: String):
	print ("key to send is "+key)
	if empty_space < SharedVariables.target_word_length:
		if "Spacer" in spelling_grid.get_child(empty_space).name:
			empty_space = empty_space + 1
		var letter_block = spelling_grid.get_child(empty_space)
		letter_block.texture = SharedVariables.keyboard_letters[key]
		letter_block.my_letter = key
		empty_space = empty_space + 1
		$"%TypeAudio".play()
		if empty_space == SharedVariables.target_word_length:
			GlobalSignals.emit_signal("show_submit", true)

			
func _delete_letter():
	if empty_space > 0:
		empty_space = empty_space - 1
		GlobalSignals.emit_signal("show_submit", false)
		if "Spacer" in spelling_grid.get_child(empty_space).name:
			empty_space = empty_space - 1
		var letter_block = spelling_grid.get_child(empty_space)
		letter_block.texture = load("res://assets/ui/ui_1080/Box Large.png")
		letter_block.my_letter = ""

func _delete_all_letters():
	if empty_space > 0:
		empty_space = 0
		GlobalSignals.emit_signal("show_submit", false)
		for block in spelling_grid.get_children():
			if !"Spacer" in block.name:
				block.texture = load("res://assets/ui/ui_1080/Box Large.png")
				block.my_letter = ""

func _check_answer():
	if empty_space == SharedVariables.target_word_length:
		var all_letters = spelling_grid.get_children()
		var word_match = true
		for index in empty_space:
			if !"Spacer" in all_letters[index].name:
				if all_letters[index].my_letter != SharedVariables.target_spelling[index]:
					word_match = false
		if word_match == true:
			print ("CORRECT!!!!!!!!")
			SharedVariables.last_game_points = main_parent.game_points
			SharedVariables.total_game_points = SharedVariables.total_game_points + main_parent.game_points
			GlobalSignals.emit_signal("remove_all_squares")
			$"%GameTimer".stop()
			$"../CorrectWord".play()
			
#			get_tree().change_scene("res://scenes/Correct.tscn")
		else:
			$"%IncorrectSound".play()
			_delete_all_letters()
			GlobalSignals.emit_signal("next_guess")
	else:
		_delete_all_letters()
		GlobalSignals.emit_signal("next_guess")
		



func _on_SkipBtn_pressed():
#	main_parent.game_points = 0
	SharedVariables.words_skipped += 1
	GlobalSignals.emit_signal("update_points", 10)
	SharedVariables.last_game_points = main_parent.game_points
	SharedVariables.total_game_points = SharedVariables.total_game_points + main_parent.game_points
	
	GlobalSignals.emit_signal("remove_all_squares")
	$"%GameTimer".stop()
	$"../CorrectWord".play()
