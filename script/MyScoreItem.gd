extends Control


func set_score(completed: int, the_time: int, score: int):
	$Completed.text = str(completed)
	$Score.text = str(score)
	var seconds = the_time%60
	var minutes = (the_time/60)%60
	var show_seconds = str(seconds)
	if (seconds<10):
		show_seconds = "0"+str(seconds)
	$Time.text = str(minutes) +":"+show_seconds
