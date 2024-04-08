extends PanelContainer


func _ready():
	GlobalSignals.connect("show_submit", self, "_show_submit")
#	GlobalSignals.connect("next_guess", self, "_next_guess")

#func _next_guess():
#	show_buttons(false)

func _show_submit(state):
	$"%SubmitButton".visible = state
	$"%SubmitButton".disabled = !state
	$"%NextButton".disabled = state
	$"%NextButton".visible = !state
	
func show_buttons(state: bool):
	visible = state


func _on_SubmitButton_pressed():
	$"%TypeAudio".play()
	GlobalSignals.emit_signal("submit_answer")


func _on_DeleteButton_pressed():
	$"%TypeAudio".play()
	GlobalSignals.emit_signal("delete_letter")


func _on_NextButton_pressed():
	$"%TypeAudio".play()
	GlobalSignals.emit_signal("submit_answer")
