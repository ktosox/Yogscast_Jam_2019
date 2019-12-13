extends ColorRect



func _on_Quit_pressed():
	get_tree().paused = false
	GM.changeToMainMenu()



func _on_Resume_pressed():
	get_tree().paused = false
	self.queue_free()

