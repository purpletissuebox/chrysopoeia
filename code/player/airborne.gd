extends State

@export var grounded_state: State
const GRAVITY_ACCEL:float = 10

func _physics_run(delta: float, player: Entity)->void:
	if player.is_on_floor():
		trigger_state_change.emit(grounded_state)
		player.broadcast("landed", [player])
	
	player.velocity.y -= GRAVITY_ACCEL * delta
