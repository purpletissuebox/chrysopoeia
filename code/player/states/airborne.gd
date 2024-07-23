extends PState

func _main(player: Player, params:PSMParams, delta: float) -> PState:
	player.velocity.y -= delta*params.gravity
	return null
