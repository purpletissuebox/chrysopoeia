extends PState

@export var idle_state: PState
@export var dead_state: PState
var time_elapsed

func _entry(_player: Entity, _params:PSMParams):
	time_elapsed = 0

func _main(player: Entity, params:PSMParams, _delta: float) -> PState:
	if player.current_health <= 0:
		player.broadcast("died", [player])
		return dead_state
	if player.is_on_floor():
		time_elapsed += _delta
		if time_elapsed > params.stuntimer:
			player.broadcast("got_up", [player])
			player.broadcast("stopped", [player])
			return idle_state
	return null
