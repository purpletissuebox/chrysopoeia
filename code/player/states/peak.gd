extends PState

@export var fall_state: PState

func _entry(player: Entity, _params: PSMParams):
	player.animate("peak")

func _main(player: Entity, params: PSMParams, _delta: float) -> PState:
	if player.velocity.y < -params.fall_threshold:
		player.broadcast("fell", [player])
		return fall_state
	else:
		return null
