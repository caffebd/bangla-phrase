extends Control


func set_score(completed: int, passed: int, score: int):
	$Completed.text = str(completed)
	$Score.text = str(score)
	$Pass.text = str(passed)
