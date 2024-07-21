extends State

@export var idle_state: State
const WALK_SPEED:float = 4
const WALK_ACCEL:float = 100

func _physics_run(delta: float, player: Entity)->void:
	var vel: Vector2 = Vector2.ZERO
	vel.x = Input.get_axis("chrys_left", "chrys_right")
	vel.y = Input.get_axis("chrys_up", "chrys_down")
	vel *= WALK_SPEED
	
	if vel == Vector2.ZERO:
		trigger_state_change.emit(idle_state)
	
	player.velocity.x = move_toward(player.velocity.x, vel.x, WALK_ACCEL*delta)
	player.velocity.z = move_toward(player.velocity.z, vel.y, WALK_ACCEL*delta)
