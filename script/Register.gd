extends Control

var email: String = ""
var password: String = ""

onready var email_field = $EmailField
onready var user_field = $UsernameField
onready var pass_field = $PassField
onready var submit_btn = $SubmitBtn
onready var fail = $Fail
onready var email_valid_label = $EmailValid
onready var pass_field_check = $PassFieldCheck
onready var user_field_check= $UserFieldCheck

var tab_controls = []
var tab_index = 0

func _ready():
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")
	Firebase.Auth.connect("login_succeeded", self, "_on_FirebaseAuth_login_succeeded")
	Firebase.Auth.connect("signup_succeeded", self, "_on_FirebaseAuth_login_succeeded")
	Firebase.Auth.connect("login_failed", self, "on_login_failed")
	Firebase.Auth.connect("signup_failed", self, "on_signup_failed")
	Firebase.Auth.connect("userdata_received", self, "userdata_received")
	tab_controls = [email_field, user_field, pass_field, submit_btn]
	email_field.grab_focus()
	
	
func _input(event):
	if event is InputEventKey and event.pressed:
		fail.visible = false
		email_valid_label.visible = false
		pass_field_check.visible = false
		user_field_check.visible = false
	if event is InputEventKey and event.scancode == KEY_SPACE:
		get_tree().set_input_as_handled()
	if event.is_action_pressed("ui_focus_next"):
		tab_index = tab_index + 1
		if tab_index > 2:
			tab_index= 0
		tab_controls[tab_index].grab_focus()
		get_tree().set_input_as_handled()


func userdata_received(user):
	print ("user data is is here for db saving")
	print (user.local_id)	
	var my_data = {email: user.email}
	var id = user.local_id
	var username:String = user_field.text.strip_edges()
	var firestore_collection : FirestoreCollection = Firebase.Firestore.collection("users")
	var add_task : FirestoreTask = firestore_collection.add(id, {"email": user.email, "account_created": OS.get_datetime(), "username":username, "topscore":0})
	var document : FirestoreTask = yield(add_task, "task_finished")
	print ("User Registered")
	var firestore_collection_scores : FirestoreCollection = Firebase.Firestore.collection("all_scores")
	var add_task_score : FirestoreTask = firestore_collection_scores.add(id, {"name": user_field.text.strip_edges(), "score": 0})
	var document_score : FirestoreTask = yield(add_task_score, "task_finished")	
	UserData.set_user_data(user)
	get_tree().change_scene("res://scenes/menu.tscn")


func _on_FirebaseAuth_login_succeeded(auth):
	var user = Firebase.Auth.get_user_data()
	
func on_login_failed(error_code, message):
	print("error code: " + str(error_code))
	print("message: " + str(message))
	fail.visible = true

func on_signup_failed(error_code, message):
	print("error code: " + str(error_code))
	print("message: " + str(message))
	if error_code == 400:
		fail.text = message
		if message == "EMAIL_EXISTS":
			$"%ErrorMessage".visible = true
			$"%NoInternet".visible = false
			$"%EmailUsed".visible = true
			$"%SomethingWrong".visible = false
	else:
		fail.text = "Something went wrong"
		$"%ErrorMessage".visible = true
		$"%NoInternet".visible = false
		$"%EmailUsed".visible = false
		$"%SomethingWrong".visible = true



func _unhandled_input(event):
	if event is InputEventMouseButton:
		print ("unhandled")
		$"%ErrorMessage".visible = false

func _on_SubmitBtn_pressed():
	check_connection()
	


func _email_validity() -> bool:
	var regex = RegEx.new()
	regex.compile("^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$")
	var valid_result = regex.search(email_field.text.strip_edges())
	print (valid_result)
	if valid_result != null:
		return true
	else:
		return false

func _pass_field_check()->bool:
	var strip_pass = pass_field.text.strip_edges()
	if strip_pass.length() > 5:
		return true
	else:
		return false

func _username_field_check()->bool:
	var strip_username = user_field.text.strip_edges()
	if strip_username.length() > 2:
		return true
	else:
		return false


func _on_BackBtn_pressed():
	get_tree().change_scene("res://scenes/LogIn.tscn")


func _on_ShowPass2_toggled(button_pressed):
	pass_field.secret = !button_pressed
	
func check_connection():
	$HTTPRequest.request("https://html-classic.itch.zone")

func _on_request_completed(result, response_code, headers, body):
	if result == 0:
		$"%ErrorMessage".visible = false
		$"%NoInternet".visible = true
		$"%EmailUsed".visible = false
		$"%SomethingWrong".visible = false
		_check_submit()
	else:
		print ("you are offline")
		$"%ErrorMessage".visible = true

func _check_submit():
	var pass_checks = true
	email_valid_label.visible = false
	user_field_check.visible = false
	pass_field_check.visible = false
	if !_email_validity():
		email_valid_label.visible = true
		pass_checks = false
	if !_pass_field_check():
		pass_field_check.visible = true
		pass_checks = false
	if !_username_field_check():
		user_field_check.visible = true
		pass_checks = false
		
	if pass_checks:
		email = email_field.text.strip_edges()
		password = pass_field.text.strip_edges()
		Firebase.Auth.signup_with_email_and_password(email, password)
