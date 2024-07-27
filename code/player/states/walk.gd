extends PState

@export var idle_state: PState

func _entry(player: Entity, _params: PSMParams):
	player.animate("walk")

func _main(player: Entity, _params: PSMParams, _delta: float) -> PState:
	if player._get_movement_direction() == Vector2.ZERO:
		player.broadcast("stopped", [player])
		return idle_state
	else:
		return null
