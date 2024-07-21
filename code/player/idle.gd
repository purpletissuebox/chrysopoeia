extends State

@export var walk_state: State
const FRICTION_SPEED:float = 20

func _physics_run(delta: float, player: Entity)->void:
	if Input.is_action_pressed("chrys_down") or Input.is_action_pressed("chrys_left") or Input.is_action_pressed("chrys_right") or Input.is_action_pressed("chrys_up"):
		trigger_state_change.emit(walk_state)
	
	player.velocity.x = move_toward(player.velocity.x, 0, FRICTION_SPEED*delta)
	player.velocity.z = move_toward(player.velocity.z, 0, FRICTION_SPEED*delta)
