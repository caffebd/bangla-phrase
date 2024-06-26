extends Control

onready var avatar = $Avatar

var can_interact: bool = false

func _ready():
	GameMusic.stop_music()
	MobileAds.connect("banner_loaded", self, "_on_MobileAds_banner_loaded")
	MobileAds.connect("initialization_complete", self, "_on_MobileAds_initialization_complete")
	if SharedVariables.set_game_time != 120:
		$CheckButton.set_pressed_no_signal(true)
	else:
		$CheckButton.set_pressed_no_signal(false)
	Firebase.Auth.connect("signup_succeeded", self, "_on_FirebaseAuth_login_succeeded")
	if UserData.logged_in:
		$"%AccountBtn".visible = true
		$"%AccountBtn".disabled = false
		$"%LoginBtn".visible = false
		$"%LoginBtn".disabled = true
		can_interact = true
	elif UserData.logged_in_anon:
		$"%AccountBtn".visible = false
		$"%AccountBtn".disabled = true
		$"%LoginBtn".visible = true
		$"%LoginBtn".disabled = false
		can_interact = true
	else:
		pass
#		Firebase.Auth.login_anonymous()
	UserData.load_local()


func _on_MobileAds_initialization_complete(status : int, adapter_name : String) -> void:
	if status == MobileAds.AdMobSettings.INITIALIZATION_STATUS.READY:
#		MobileAds.load_interstitial()
#		MobileAds.load_rewarded()
#		MobileAds.load_rewarded_interstitial()
		MobileAds.load_banner()
	else:
		$Error.visible = true

func _on_FirebaseAuth_login_succeeded(auth_info : Dictionary):
	print ("anon login")
	avatar.texture_normal  = load("res://assets/menu/anon_avatar.png")
	avatar.visible = true
	UserData.logged_in_anon = true
	can_interact = true
	print (str(Firebase.Firestore._offline))
	

func _on_PlayBtn_pressed():
	if can_interact:
		SharedVariables.temp_number = int($LineEdit.text)
		SharedVariables.reset_levels()
		get_tree().change_scene("res://scenes/main.tscn")


func _on_LoginBtn_pressed():
	if can_interact:
		get_tree().change_scene("res://scenes/LogIn.tscn")


func _on_ScoresBtn_pressed():
	if can_interact:
		get_tree().change_scene("res://scenes/ScoresPage.tscn")






func _on_AccountBtn_pressed():
	if UserData.logged_in:
		get_tree().change_scene("res://scenes/UserAccount.tscn")


func _on_InstructionsBtn_pressed():
	get_tree().change_scene("res://scenes/Instructions.tscn")


func _on_CheckButton_toggled(button_pressed):
	if button_pressed:
		SharedVariables.set_game_time = 7200
		print ("test mode")
	else:
		SharedVariables.set_game_time = 120
#	MobileAds.show_banner()


func _on_MobileAds_banner_loaded() -> void:
	print ("BANNER LOADED")
	MobileAds.show_banner()

