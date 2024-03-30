extends Control

var email: String = ""
var password: String = ""

onready var email_field = $EmailField
onready var pass_field = $PassField
onready var submit_btn = $SubmitBtn
onready var fail = $fail

var tab_controls = []
var tab_index = 0

func _ready():
	Firebase.Auth.connect("login_succeeded", self, "_on_FirebaseAuth_login_succeeded")
	Firebase.Auth.connect("signup_succeeded", self, "_on_FirebaseAuth_login_succeeded")
	Firebase.Auth.connect("login_failed", self, "on_login_failed")
	Firebase.Auth.connect("signup_failed", self, "on_signup_failed")
	Firebase.Auth.connect("userdata_received", self, "userdata_received")
	Firebase.Auth.connect("logged_out", self, "_logged_out")
	tab_controls = [email_field, pass_field, submit_btn]
	email_field.grab_focus()

func _input(event):
	if event is InputEventKey and event.pressed:
		fail.visible = false
	if event.is_action_pressed("ui_focus_next"):
		tab_index = tab_index + 1
		if tab_index > 2:
			tab_index= 0
		tab_controls[tab_index].grab_focus()
		get_tree().set_input_as_handled()


func userdata_received(user):
	print ("user data is is here for db saving")
	print (user.local_id)
	UserData.set_user_data(user)
	var my_data = {email: user.email}
	var id = user.local_id
	var firestore_collection : FirestoreCollection = Firebase.Firestore.collection("users")
	var time = OS.get_ticks_msec()
	var add_task : FirestoreTask = firestore_collection.update(id, {"last_login": OS.get_datetime() })
	var document : FirestoreTask = yield(add_task, "task_finished")
	print ("Logged in as "+id)
	get_tree().change_scene("res://scenes/menu.tscn")
	
	

func _get_user_high_score(my_id: String):
	var collection : FirestoreCollection = Firebase.Firestore.collection("users")
	var document_task : FirestoreTask = collection.get(my_id)
	var document : FirestoreDocument = yield(document_task, "get_document")
	print (document["doc_fields"]["topscore"])
	UserData.user_topscore = document["doc_fields"]["topscore"]
	

func _task_finished():
	print ("TASK DONE")

func _on_register_pressed():
	email = email_field.text.strip_edges()
	password = pass_field.text.strip_edges()
	Firebase.Auth.signup_with_email_and_password(email, password)

func _on_FirebaseAuth_login_succeeded(auth):
	var user = Firebase.Auth.get_user_data()
	
func on_login_failed(error_code, message):
	print("error code: " + str(error_code))
	print("message: " + str(message))
	fail.visible = true

func on_signup_failed(error_code, message):
	print("error code: " + str(error_code))
	print("message: " + str(message))	



#func _on_SubmitBtn_pressed():
#	Firebase.Auth.logout()

#func _logged_out():

func _on_SubmitBtn_pressed():	
	email = email_field.text.strip_edges()
	password = pass_field.text.strip_edges()
	Firebase.Auth.login_with_email_and_password(email, password)


func _on_ShowPass_toggled(button_pressed):
	pass_field.secret = !button_pressed


func _on_RegisterBtn_pressed():
	get_tree().change_scene("res://scenes/Register.tscn")


func _on_BackBtn_pressed():
	get_tree().change_scene("res://scenes/menu.tscn")
