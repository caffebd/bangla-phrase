extends Control

onready var avatar = $Avatar

var can_interact: bool = false

func _ready():
	Firebase.Auth.connect("signup_succeeded", self, "_on_FirebaseAuth_login_succeeded")
	if UserData.logged_in:
		avatar.texture_normal = load("res://assets/menu/panda_avatar.png")
#		avatar.visible = true
		can_interact = true
	elif UserData.logged_in_anon:
		avatar.texture_normal = load("res://assets/menu/anon_avatar.png")
#		avatar.visible = true
		can_interact = true
	else:
		pass
#		Firebase.Auth.login_anonymous()
	UserData.load_local()


func _on_FirebaseAuth_login_succeeded(auth_info : Dictionary):
	print ("anon login")
	avatar.texture_normal  = load("res://assets/menu/anon_avatar.png")
	avatar.visible = true
	UserData.logged_in_anon = true
	can_interact = true
	print (str(Firebase.Firestore._offline))
	

func _on_PlayBtn_pressed():
	if can_interact:
		SharedVariables.reset_levels()
		get_tree().change_scene("res://scenes/main.tscn")


func _on_LoginBtn_pressed():
	if can_interact:
		get_tree().change_scene("res://scenes/LogIn.tscn")


func _on_ScoresBtn_pressed():
	if can_interact:
		get_tree().change_scene("res://scenes/ScoresPage.tscn")


func _on_Avatar_pressed():
	if UserData.logged_in:
		get_tree().change_scene("res://scenes/UserAccount.tscn")
