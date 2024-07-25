class_name Enemy extends Entity

@export var params:PSMParams

@onready var p_state_machine = $PStateMachine
@onready var player_ref = get_parent().get_node("Player")

func _get_movement_direction():
	var result:Vector2 = Vector2.ZERO
	
	if player_ref != null:
		result.x = sign(position.direction_to(player_ref.position).x)
		result.y = sign(position.direction_to(player_ref.position).y)

	return result
