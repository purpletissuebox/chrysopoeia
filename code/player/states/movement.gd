extends PState

func _main(player: Player, params: PSMParams, delta: float):
	var mvmnt: Vector3
	
	mvmnt.x = Input.get_axis("chrys_left", "chrys_right")
	mvmnt.y = 0
	mvmnt.z = Input.get_axis("chrys_up", "chrys_down")
	mvmnt = mvmnt.normalized()*params.top_speed
	
	mvmnt.y = player.velocity.y
	player.velocity = player.velocity.move_toward(mvmnt, delta*params.acceleration)
	return null
