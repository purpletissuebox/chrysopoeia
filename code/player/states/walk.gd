extends PState

@export var idle_state: PState

func _entry(player: Player, _params: PSMParams):
	player.animate("walk")

func _main(player: Player, _params: PSMParams, _delta: float) -> PState:
	if !(Input.is_action_pressed("chrys_left") || Input.is_action_pressed("chrys_right") || Input.is_action_pressed("chrys_down") || Input.is_action_pressed("chrys_up")):
		player.broadcast("stopped", [player])
		return idle_state
	else:
		return null
