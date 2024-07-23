extends PState

func _entry(player: Player, _params:PSMParams):
	player.animate("dead")

func _main(player: Player, params:PSMParams, delta: float) -> PState:
	if !player.is_on_floor():
		player.velocity.y -= params.gravity*delta
	return null
