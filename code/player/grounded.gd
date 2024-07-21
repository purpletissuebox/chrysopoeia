extends State

@export var airborne_state: State
const JUMP_SPEED:float = 5.5

func _enter(player:Entity):
	player.velocity.y = 0

func _physics_run(_delta: float, player: Entity)->void:
	if !player.is_on_floor():
		trigger_state_change.emit(airborne_state)
	
	if Input.is_action_just_pressed("chrys_jump"):
		player.velocity.y = JUMP_SPEED
		player.broadcast("jumped", [player])
		trigger_state_change.emit(airborne_state)
