extends Control

var score_item_scene = preload("res://scenes/ScoreItem.tscn")

func _ready():
	var query : FirestoreQuery = FirestoreQuery.new()
	query.from("all_scores")
	query.order_by("score", FirestoreQuery.DIRECTION.DESCENDING)

	var result : Array = yield(Firebase.Firestore.query(query), "result_query")
#	for i in 50:
	for item in result:	
		var score = item["doc_fields"]["score"]
#		var name = yield(UserData.get_username_for_score(item["doc_name"]), "completed")
		var name = item["doc_fields"]["name"]
		print (name + "..." + str(score))
		var score_item = score_item_scene.instance()
		score_item.set_score(name, score)
		$"%ScoreHolder".add_child(score_item)
												
		

