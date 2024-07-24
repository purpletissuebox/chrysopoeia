extends PState

func _main(player: Entity, params: PSMParams, delta: float):
	var mvmnt: Vector3
	
	mvmnt.x = player._get_movement_direction().x
	mvmnt.y = 0
	mvmnt.z = player._get_movement_direction().y
	mvmnt = mvmnt.normalized()*params.top_speed
	
	if mvmnt != Vector3.ZERO:
		mvmnt.y = player.velocity.y
		player.velocity = player.velocity.move_toward(mvmnt, delta*params.acceleration)
	return null
