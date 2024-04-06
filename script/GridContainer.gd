extends GridContainer

var rng : RandomNumberGenerator = RandomNumberGenerator.new()

onready var spelling_grid = $"../SpellingGridContainer"
onready var stop_button = $"../ButtonContainer/StopButton"
onready var keyboard_grid = $"../KeyboardContainer/KeyboardGrid"
onready var buttons_container = $"../ButtonsContainer"
onready var flash_timer = $"%FlashTimer"

onready var stop_animation = $"%StopBtnAnimation"

var cover_image = preload("res://assets/ui/ui_1080/Blue Box.png")
var square_image = preload("res://assets/ui/ui_1080/Orange Box.png")

onready var main_parent = $".."

var last_square: TextureRect

var flashing: bool = true

var flash_speed: float = 0.2

var first_square: bool = true

var paused = false

var squares_array : Array =[]
onready var all_squares: Array = [
$a1,$a2,$a3,$a4,$b1,$b2,$b3,$b4,$c1,$c2,$c3,$c4,
$d1,$d2,$d3,$d4
]


var avail_positions: Array = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]

func _ready():
	rng.randomize() 
	GlobalSignals.connect("next_guess", self, "_next_guess")
	GlobalSignals.connect("game_paused", self, "_pause_game")
	GlobalSignals.connect("remove_all_squares", self, "_remove_all_squares")
	squares_array = all_squares.duplicate()
	yield(get_tree().create_timer(0.5), "timeout")
	stop_animation.play("flash")
	start_flashing()	

func _pause_game(is_paused: bool):
	paused = is_paused


func _next_guess():	
	if avail_positions.size() > 0:
		keyboard_grid.show_keyboard(false)
		buttons_container.show_buttons(false)
		stop_button.disabled = false
		stop_button.visible = true
		flashing = true
		stop_animation.play("flash")
		start_flashing()

func start_flashing():
	var position: int = 0
	var index: int  = 0
	while flashing:
		if !paused:
			index = rng.randi_range (0,avail_positions.size()-1)
			position = avail_positions[index]
			flash_cover(squares_array[position])
		flash_timer.start()	
		yield(flash_timer, "timeout")
#		yield(get_tree().create_timer(flash_speed), "timeout")	
	if avail_positions.size() > 0:
		avail_positions.remove(index)		
	stop_button.disabled = true
	stop_button.visible = false
	reveal_square(position)
	if avail_positions.size() == 0:
		GlobalSignals.emit_signal("show_help")

func reveal_square(pos: int):
#	NO FADE
#	squares_array[pos].modulate.a = 0.0
	var tween = create_tween()
	tween.tween_property(squares_array[pos], "modulate:a", 0.0, 0.5)
	keyboard_grid.show_keyboard(true)
	buttons_container.show_buttons(true)
	if !first_square:
		main_parent.game_points = main_parent.game_points - 2
		main_parent.update_points()
	else:
		first_square = false
	

func flash_cover(square: TextureRect):
	if last_square != null:
		last_square.texture = square_image
	square.texture = cover_image
	last_square = square

func _remove_all_squares():
	for square in squares_array:
		var tween = create_tween()
		tween.tween_property(square, "modulate:a", 0.0, 0.5)
	avail_positions.clear()
	flashing = false
	


func _on_TextureButton_button_down():
	stop_animation.stop()
	Input.vibrate_handheld(200)
	flashing = false
	


