extends PState

@export var rise_state: PState

func _main(player: Entity, _params: PSMParams, _delta: float) -> PState:
	if player._wants_to_jump():
		player.broadcast("jumped", [player])
		return rise_state
	else:
		return null
