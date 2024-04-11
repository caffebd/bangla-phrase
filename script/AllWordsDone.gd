extends Control

func _ready():
	UserData.update_local_data()
	$"%CorrectCount".text = str(SharedVariables.words_complete)
	$"%ScoreCount".text = str(SharedVariables.total_game_points)
	$"%PassCount".text = str(SharedVariables.words_skipped)
	if UserData.user_topscore < SharedVariables.total_game_points:
		$"%NewHighBanner".visible = true


func _on_MenuButton_pressed():
	get_tree().change_scene("res://scenes/menu.tscn")
