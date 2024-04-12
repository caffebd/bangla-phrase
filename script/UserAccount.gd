extends Control

onready var username_field =  $Username
onready var pass_reset = $CheckEmail
onready var save_timer = $SaveTimer
onready var user_email_field = $UserEmail

func _ready():
	print (UserData.user_name)
	$"%WaitBounce".visible = false
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
			$"%WaitBounce".visible = true
			save_timer.stop()
			save_timer.start()




func _on_ResetPass_pressed():
	Firebase.Auth.send_password_reset_email(UserData.user_email)
	pass_reset.visible = true


func _on_SaveTimer_timeout():
	UserData.update_user_name(username_field.text)
	$"%WaitBounce".visible = false


func _on_SignOutBtn_pressed():
	Firebase.Auth.logout()
	UserData.logged_in_anon = true
	UserData.logged_in = false
	UserData.user_email = ""
	UserData.user_name = ""
	UserData.user_id = ""
	get_tree().change_scene("res://scenes/menu.tscn")
