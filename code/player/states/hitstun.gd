extends PState

func _entry(player: Entity, _params:PSMParams):
	player.animate("hitstun")

func _main(_player: Entity, _params:PSMParams, _delta: float) -> PState:
	return null
