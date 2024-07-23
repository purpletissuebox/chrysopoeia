extends PState

@export var fall_state: PState

func _entry(player: Player, _params: PSMParams):
	player.animate("peak")

func _main(player: Player, params: PSMParams, _delta: float) -> PState:
	if player.velocity.y < params.fall_threshold:
		player.broadcast("fell", [player])
		return fall_state
	else:
		return null
