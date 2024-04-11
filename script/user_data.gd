extends Node


const SAVE_PATH = "user://phrase_save.json"


var user_email: String = ""
var user_name: String = ""
var user_id: String = ""
var user_topscore: int = 0
var logged_in: bool = false
var logged_in_anon: bool = true

var local_scores: Array = []

var local_user_data: Array = []


signal complete



class MyCustomSorter:
	static func sort_descending(a, b):
		if a["score"] > b["score"]:
			return true
		return false

func set_user_data(user_data):
#	user_email = user_data.email
	user_email = user_data.email
	user_id = user_data.local_id
	logged_in_anon = false
	logged_in = true
	_get_my_username()


#func _get_user_name():
#	print ("get un "+user_id)
#	var collection : FirestoreCollection = Firebase.Firestore.collection("users")
#	collection.connect("get_document",self,"_on_get_document")	
#	collection.get(user_id)
#
#func _on_get_document(document : FirestoreDocument):
#	print (document["doc_fields"]["username"])
#	user_name = document["doc_fields"]["username"]
#	user_topscore = document["doc_fields"]["topscore"]

func _get_my_username():
	print ("getting iser name for "+user_id)
	var collection : FirestoreCollection = Firebase.Firestore.collection("users")
	var document_task : FirestoreTask = collection.get(user_id)
	var document : FirestoreDocument = yield(document_task, "get_document")
	user_name = document["doc_fields"]["username"]
	user_topscore = document["doc_fields"]["topscore"]

func get_username_for_score(doc_id)->String:
	print ("getting score name for "+doc_id)
	var collection : FirestoreCollection = Firebase.Firestore.collection("users")
	var document_task : FirestoreTask = collection.get(doc_id)
	var document : FirestoreDocument = yield(document_task, "get_document")
	user_name = document["doc_fields"]["username"]
	return user_name	
	
func update_user_name(new_name:String):
	print ("new name "+new_name)
	var firestore_collection : FirestoreCollection = Firebase.Firestore.collection("users")
	var add_task : FirestoreTask = firestore_collection.update(UserData.user_id, {"username": new_name })
	var document : FirestoreTask = yield(add_task, "task_finished")
	print ("username updated")
	user_name = new_name
	update_username_in_top_scores()

func update_username_in_top_scores():
	var firestore_collection_scores : FirestoreCollection = Firebase.Firestore.collection("all_scores")
	var document_task : FirestoreTask = firestore_collection_scores.get(user_id)
	if not document_task:
		print ("No SCORE FOUDN")
	else:
		print ("exisitng found")
		var id = UserData.user_id
		var add_task_score : FirestoreTask = firestore_collection_scores.update(id, {"name":user_name})
		var document_score_update : FirestoreTask = yield(add_task_score, "task_finished")	

func send_score():
	user_topscore = SharedVariables.total_game_points 
	var id = UserData.user_id
	var firestore_collection : FirestoreCollection = Firebase.Firestore.collection("users")
	var add_task : FirestoreTask = firestore_collection.update(id, {"topscore": SharedVariables.total_game_points })
	var document : FirestoreTask = yield(add_task, "task_finished")
	print ("user score updated")
	var firestore_collection_scores : FirestoreCollection = Firebase.Firestore.collection("all_scores")
	
	var add_task_score : FirestoreTask = firestore_collection_scores.update(id, {"score":SharedVariables.total_game_points , "name":user_name})
	var document_score : FirestoreTask = yield(add_task, "task_finished")		

func save_local():
	var save_dict = {}
	save_dict["my_scores"] = local_save_data()
	var save_file = File.new()
	save_file.open(SAVE_PATH, File.WRITE) 
	save_file.store_line(to_json(save_dict))
	save_file.close()
	print ("saved")


func load_local():
	var save_file = File.new()
	if save_file.file_exists(SAVE_PATH):
		save_file.open(SAVE_PATH, File.READ)
		print (SAVE_PATH)
		var data = {	}
		local_user_data = []
		data = JSON.parse(save_file.get_as_text()).result
		for attribute in data["my_scores"]:
			for the_data in data["my_scores"]["local_user_data"]:
				local_user_data.append({
					"score": the_data["score"],
					"pass": the_data["pass"],
					"complete": the_data["complete"],
					})				
		local_user_data.sort_custom(MyCustomSorter, "sort_descending")
		print (local_user_data[0]["score"])
		user_topscore = local_user_data[0]["score"]
			

	
func local_save_data():
	var save_scores = {
		local_user_data=local_user_data
	}
	return save_scores

func update_local_data():
	local_user_data.append({
		"score": SharedVariables.total_game_points,
		"pass": SharedVariables.words_skipped,
		"complete": SharedVariables.words_complete		
	})
	print (local_user_data)
	save_local()

#func update_local_scores():
#	local_scores.append(SharedVariables.total_game_points)
#	local_scores.sort()
#	local_scores.invert()
#	print (local_scores)
#	if local_scores.size() > 5:
#		local_scores.pop_back()
#	save_local()	

