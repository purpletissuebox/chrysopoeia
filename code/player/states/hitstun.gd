extends PState

func _entry(player: Player, _params:PSMParams):
	player.animate("hitstun")

func _main(_player: Player, _params:PSMParams, _delta: float) -> PState:
	return null
