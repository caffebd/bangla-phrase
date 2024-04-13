extends Control

onready var all_scores_page = $AllScores
onready var my_scores_page = $MyScores


func _ready():
	pass
#	$"%MyScoresBtn".rect_scale = Vector2(1.8, 1.8)
#	$"%AllScoresBtn".rect_scale = Vector2(1.7, 1.7)

func _on_BackButton_pressed():
	get_tree().change_scene("res://scenes/menu.tscn")

	


		
#func _on_MyScoresBtn_pressed():
#	$"%MyScoresBtn".rect_scale = Vector2(1.8, 1.8)
#	$"%AllScoresBtn".rect_scale = Vector2(1.7, 1.7)
#	my_scores_page.visible = true
#	all_scores_page.visible = false
#
#
#func _on_AllScoresBtn_pressed():
#	$"%MyScoresBtn".rect_scale = Vector2(1.7, 1.7)
#	$"%AllScoresBtn".rect_scale = Vector2(1.9, 1.9)
#	my_scores_page.visible = false
#	all_scores_page.visible = true


func _on_MyScoresBtn_toggled(button_pressed):
	my_scores_page.visible = true
	all_scores_page.visible = false
	$"%AllScoresBtn".set_pressed_no_signal(false)


func _on_AllScoresBtn_toggled(button_pressed):
	my_scores_page.visible = false
	all_scores_page.visible = true
	$"%MyScoresBtn".set_pressed_no_signal(false)
