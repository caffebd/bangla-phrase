extends Control

func set_score(name: String, score: int):
	$name.text = name
	$score.text = str(score)
	
