extends PState

@export var walking_state: PState

func _main(player: Player, params:PSMParams, _delta: float) -> PState:
	if Input.is_action_pressed("chrys_left") || Input.is_action_pressed("chrys_right") || Input.is_action_pressed("chrys_down") || Input.is_action_pressed("chrys_up"):
		player.broadcast("moved", [player])
		return walking_state
	else:
		if player.velocity.length() >= params.skid_threshold:
			player.animate("skid")
		else:
			player.animate("idle")
		return null
