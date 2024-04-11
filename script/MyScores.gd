extends Control

var score_item_scene = preload("res://scenes/MyScoreItem.tscn")

func _ready():
	for score_data in UserData.local_user_data:
#		print (score_data)
#		for i in 50:
		var score_item = score_item_scene.instance()
		score_item.set_score(score_data["complete"], score_data["pass"], score_data["score"])
		$"%MyScoreHolder".add_child(score_item)
