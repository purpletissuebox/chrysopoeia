extends PState

@export var walking_state: PState

func _main(player: Entity, params:PSMParams, delta: float) -> PState:
	if player._get_movement_direction() != Vector2.ZERO:
		player.broadcast("moved", [player])
		return walking_state
	else:
		player.velocity = player.velocity.move_toward(Vector3.ZERO, delta*params.friction)
		if player.velocity.length() >= params.skid_threshold:
			player.animate("skid")
		else:
			player.animate("idle")
		return null
