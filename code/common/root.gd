extends Node

@onready var current_mode:Node = $Control
@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer

func _ready():
	Constants.change_mode.connect(change_modes)
	animation_player.play_backwards("fade")
	
func change_modes(path_to_mode: String):
	animation_player.play("fade")
	await animation_player.animation_finished
	
	remove_child(current_mode)
	current_mode.queue_free()
	current_mode = load(path_to_mode).instantiate()
	add_child(current_mode)
	
	animation_player.play_backwards("fade")
	await animation_player.animation_finished
