extends Control

func exit_credits():
	self.queue_free()

func exit_game():
	get_tree().quit()
