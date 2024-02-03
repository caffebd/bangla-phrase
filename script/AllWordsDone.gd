extends Control

func _ready():
	UserData.update_local_data()

func _on_Button_pressed():
	get_tree().change_scene("res://scenes/menu.tscn")
