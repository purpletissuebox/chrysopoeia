extends PState

@export var pain_state: PState
@export var air_pain_state: PState

func _main(player: Player, _params:PSMParams, _delta: float) -> PState:
	if player.num_hazards > 0:
		player.broadcast("took_hit", [player])
		if player.is_on_floor():
			return pain_state
		else:
			return air_pain_state
	return null
