extends PState

@export var land_state: PState

func _entry(player: Player, _params: PSMParams):
	player.animate("fall")

func _main(player: Player, _params:PSMParams, _delta: float) -> PState:
	if player.is_on_floor():
		player.broadcast(Constants.listeners[Constants.LISTENERS.LANDED] [player])
		return land_state
	else:
		return null
