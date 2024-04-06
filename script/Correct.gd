extends Control

signal shrink_done

onready var stars = [$Star1,$Star2,$Star3]
onready var star_tween = $Tween
onready var points_label = $CorrectBanner/PointsLabel

var one_positions = [370]
var two_positions = [220, 540]
var three_positions = [140, 370, 630]

var current_star = 0

var star_y = 1240

func _ready():
#	points_label.text = str(SharedVariables.last_game_points)
	points_label.text = str(SharedVariables.last_game_points)
	SharedVariables.words_complete = SharedVariables.words_complete + 1
	$ShowImage.texture = SharedVariables.word_images[SharedVariables.target_word ]
	if UserData.logged_in:
		if UserData.user_topscore < SharedVariables.total_game_points:
			UserData.send_score()
	if SharedVariables.last_game_points > 89:
		position_stars(2)
	elif SharedVariables.last_game_points > 59:
		position_stars(1)
	elif SharedVariables.last_game_points > 19:
		position_stars(0)





func position_stars(count: int):
	match count:
		0:
			current_star = -1
			stars[0].position = Vector2(540, star_y)
			get_tree().create_timer(0.1).connect("timeout", self, "_next_star")		
		1:
			current_star = -1
			stars[0].position = Vector2(380, star_y)
			stars[1].position = Vector2(700, star_y)
			get_tree().create_timer(0.1).connect("timeout", self, "_next_star")		
			get_tree().create_timer(1).connect("timeout", self, "_next_star")

		2:
			current_star = -1
			stars[0].position = Vector2(200, star_y+20)
			stars[1].position = Vector2(540, star_y-5)
			stars[2].position = Vector2(880, star_y+20)
			get_tree().create_timer(0.1).connect("timeout", self, "_next_star")		
			get_tree().create_timer(1).connect("timeout", self, "_next_star")
			get_tree().create_timer(2).connect("timeout", self, "_next_star")


func _next_star():
	current_star = current_star + 1
	show_star(current_star)
	
					

func show_star(count: int):
	$StarSound.play()
	stars[count].visible = true
	stars[count].play()
	star_tween.interpolate_property(stars[count], "scale", Vector2(9,9), Vector2(4,4), 0.7, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	star_tween.start()
	



func _on_Tween_tween_completed(object, key):
	print (key)
	object.stop()
	while object.frame !=0:
		if object.frame < 29:
			object.frame = object.frame  + 1
		else:
			object.frame = 0
	


func _on_NextBtn_pressed():
	star_tween.stop_all()
	star_tween.remove_all()
	if SharedVariables.all_keys_size == 0:
		get_tree().change_scene("res://scenes/AllWordsDone.tscn")	
	else:
		get_tree().change_scene("res://scenes/main.tscn")
