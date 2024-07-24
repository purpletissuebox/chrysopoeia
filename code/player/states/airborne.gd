extends PState

func _main(player: Entity, params:PSMParams, delta: float) -> PState:
	player.velocity.y -= delta*params.gravity
	return null
