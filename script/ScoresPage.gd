extends Control

onready var all_scores_page = $AllScores
onready var my_scores_page = $MyScores


func _on_BackButton_pressed():
	get_tree().change_scene("res://scenes/menu.tscn")

	


		
func _on_MyScoresBtn_pressed():
	my_scores_page.visible = true
	all_scores_page.visible = false


func _on_AllScoresBtn_pressed():
	my_scores_page.visible = false
	all_scores_page.visible = true
