class_name Enemy extends Entity

@export var params:PSMParams

@onready var p_state_machine = $PStateMachine
@onready var player_ref = get_tree().root.find_child("Player", true, false)

func _get_movement_direction():
	var result:Vector2 = Vector2.ZERO#

	if player_ref != null:
		result.x = position.direction_to(player_ref.position).x
		result.y = position.direction_to(player_ref.position).z
	else:
		player_ref = find_player()
	return result

func find_player():
	return get_tree().root.find_child("Player", true, false)
