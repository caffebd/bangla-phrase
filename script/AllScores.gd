extends Control

var score_item_scene = preload("res://scenes/ScoreItem.tscn")

func _ready():
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")
	GlobalSignals.connect("check_connection", self, "check_connection")
#	check_connection()

func _get_scores():
	var query : FirestoreQuery = FirestoreQuery.new()
	query.from("all_scores")
	query.order_by("score", FirestoreQuery.DIRECTION.DESCENDING)
	for n in $"%ScoreHolder".get_children():
		$"%ScoreHolder".remove_child(n)
		n.queue_free()
	var result : Array = yield(Firebase.Firestore.query(query), "result_query")
#	for i in 50:
	$ScrollContainer.visible = true
	$"%LoadingAnim".visible = false
	for item in result:	
		var score = item["doc_fields"]["score"]
#		var name = yield(UserData.get_username_for_score(item["doc_name"]), "completed")
		var name = item["doc_fields"]["name"]
		print (name + "..." + str(score))
		var score_item = score_item_scene.instance()
		score_item.set_score(name, score)
		$"%ScoreHolder".add_child(score_item)
												
		

func check_connection():
	$"%LoadingAnim".visible = true
	$ScrollContainer.visible = false
	$HTTPRequest.request("https://html-classic.itch.zone")

func _on_request_completed(result, response_code, headers, body):
	print (result)
	if result == 0:
		
		$"%ErrorMessage".visible = false
		_get_scores()
	else:
		print ("offline")
		$"%LoadingAnim".visible = false
		$"%ErrorMessage".visible = true
