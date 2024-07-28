extends Control

func _ready():
	SoundDriver.playBGM(SoundDriver.BGM_IDS.FIRST_SONG)

func start_game():
	Constants.change_mode.emit("res://scenes/gameplay/world_map.tscn")

func exit_game():
	get_tree().quit()

func open_options():
	self.add_child(load("res://scenes/menus/options.tscn").instantiate())

func open_instructions():
	self.add_child(load("res://scenes/menus/instructions.tscn").instantiate())
	
func open_credits():
	self.add_child(load("res://scenes/menus/credits.tscn").instantiate())
