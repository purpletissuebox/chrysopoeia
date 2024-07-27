extends PState

@export var land_state: PState

func _entry(player: Entity, _params: PSMParams):
	player.animate("fall")

func _main(player: Entity, _params:PSMParams, _delta: float) -> PState:
	if player.is_on_floor():
		player.broadcast("landed", [player])
		return land_state
	else:
		return null
