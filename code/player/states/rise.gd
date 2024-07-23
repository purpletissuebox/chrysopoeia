extends PState

@export var peak_state: PState

func _entry(player: Player, params: PSMParams):
	player.velocity.y = params.jump_force
	player.animate("jump")

func _main(player: Player, params: PSMParams, _delta: float) -> PState:
	if player.velocity.y < -params.fall_threshold:
		player.broadcast("jump_peaked", [player])
		return peak_state
	else:
		return null