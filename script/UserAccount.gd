extends Control

onready var username_field =  $Username
onready var pass_reset = $PassCheckEmail
onready var save_timer = $SaveTimer
onready var user_email_field = $UserEmail

func _ready():
	print (UserData.user_name)
	username_field.text = UserData.user_name
	user_email_field.text = UserData.user_email



func _on_BackBtn_pressed():
	UserData.update_user_name(username_field.text)
	get_tree().change_scene("res://scenes/menu.tscn")


func _input(event):
	if event is InputEventKey and event.pressed:
		if event is InputEventKey and event.scancode == KEY_SPACE:
			get_tree().set_input_as_handled()
		else:
			save_timer.stop()
			save_timer.start()




func _on_ResetPass_pressed():
	Firebase.Auth.send_password_reset_email(UserData.user_email)
	pass_reset.visible = true


func _on_SaveTimer_timeout():
	UserData.update_user_name(username_field.text)
