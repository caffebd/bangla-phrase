extends PanelContainer


func _ready():
	pass
#	GlobalSignals.connect("next_guess", self, "_next_guess")

#func _next_guess():
#	show_buttons(false)

func show_buttons(state: bool):
	visible = state


func _on_SubmitButton_pressed():
	GlobalSignals.emit_signal("submit_answer")


func _on_DeleteButton_pressed():
	GlobalSignals.emit_signal("delete_letter")
