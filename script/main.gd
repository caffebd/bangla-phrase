extends Control


onready var grid = $GridContainer
onready var frame_container = $FrameContainer
onready var main_image = $MainImageContainer/MainImage
onready var keyboard_grid = $KeyboardContainer/KeyboardGrid
onready var keyboard_container = $KeyboardContainer
onready var spelling_grid = $SpellingGridContainer
onready var buttons_container = $ButtonsContainer
onready var stop_button = $ButtonContainer
onready var game_timer = $GameTimer
onready var timer_label = $"%Timer"
onready var points_label = $"%Points"
onready var game_points_label = $"%AllPointsLabel"

onready var popup_panel = $"%PopupPanel"
onready var quit_btn = $"%QuitBtn"
onready var flash_timer = $"%FlashTimer"

onready var word_audio = $CorrectWord

var screen_size: Vector2 = Vector2(720, 1080)
var x_scale_factor: float = 1.0
var y_scale_factor: float = 1.0
var flashing = true

var current_word: String = ""

var game_time: int = 0
var game_points: int = 100

var spelling_y: float = 1200
var keyboard_y: float = 1370

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = OS.window_size
	$DebugHeight.text = str(screen_size)
	x_scale_factor = screen_size.x / 1080
	points_label.text = str(game_points)
	game_points_label.text = str(SharedVariables.total_game_points)
	flash_timer.wait_time = SharedVariables.flashing_time
#	y_scale_factor = screen_size.y / 1080
#	$PanelContainer.rect_scale = Vector2(x_scale_factor,x_scale_factor)
	var frame_bottom = frame_container.rect_position.y + 900 
	var y_gap_size = buttons_container.rect_position.y - frame_bottom - 450
	var y_gap = y_gap_size / 2.5
	$DebugHeight.text = str(y_gap)
	spelling_grid.rect_position.y = frame_bottom + y_gap
	keyboard_container.rect_position.y = spelling_grid.rect_position.y + 150 + y_gap
	stop_button.rect_position.y = keyboard_container.rect_position.y
	GlobalSignals.connect("show_help", self, "_show_help")
	$"%SkipBtn".visible = false
	$"%SkipBtn".disabled = true
	pick_word()

func pick_word():
	current_word = SharedVariables.get_random_easy_level()
	main_image.texture = SharedVariables.word_images[current_word]
	
	word_audio.stream = SharedVariables.word_audio[current_word]
	
	SharedVariables.target_spelling = SharedVariables.test_levels[current_word]["spelling"]
	print(SharedVariables.target_spelling)
	keyboard_grid.place_all_keys(current_word)
	spelling_grid.get_word_length(current_word)
	SharedVariables.target_word = current_word
	SharedVariables.last_game_points = 0
	start_timer()

func start_timer():
	game_timer.start()


func _on_GameTimer_timeout():
	game_time = game_time + 1
	SharedVariables.total_seconds = SharedVariables.total_seconds + 1
	var seconds = game_time%60
	var minutes = (game_time/60)%60
	var show_seconds = str(seconds)
	if (seconds<10):
		show_seconds = "0"+str(seconds)
	timer_label.text = str(minutes) +":"+show_seconds
#	print (str(game_time%10)) 
	if game_time%10 == 0:
		var point_reduction = int(game_time/10)
		game_points = game_points - (point_reduction)
		if game_points <= 0:
			game_points = 0
		update_points()
	
func update_points():
	points_label.text = str(game_points)
	if game_points <= 0:
		grid.remove_all_squares()


func _on_MenuButton_pressed():
	GlobalSignals.emit_signal("game_paused", true)
	get_tree().paused = true
	popup_panel.popup()



func _on_PopupPanel_popup_hide():
	GlobalSignals.emit_signal("game_paused", false)
	get_tree().paused = false


func _on_QuitBtn_pressed():
	print ("QUIT")
	UserData.update_local_data()
	if UserData.logged_in:
		if UserData.user_topscore < SharedVariables.total_game_points:
			UserData.send_score()
	GlobalSignals.emit_signal("game_paused", false)
	get_tree().paused = false
	flash_timer.stop()
	get_tree().change_scene("res://scenes/menu.tscn")


func _on_CorrectWord_finished():
	yield (get_tree().create_timer(0.5), "timeout")
	get_tree().change_scene("res://scenes/Correct.tscn")

func _show_help():
	$"%SkipBtn".visible = true
	$"%SkipBtn".disabled = false



	
	


func _on_MusicBtn_toggled(button_pressed):
	print ("toggle")
