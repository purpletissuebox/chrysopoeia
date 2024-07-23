extends PState

@export var rise_state: PState

func _main(player: Player, _params: PSMParams, _delta: float) -> PState:
	if Input.is_action_pressed("chrys_jump"):
		player.broadcast("jumped", [player])
		return rise_state
	else:
		return null