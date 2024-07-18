extends Control

func exit_game():
	get_tree().quit()

func open_options():
	self.add_child(load("res://scenes/options menu/options.tscn").instantiate())
