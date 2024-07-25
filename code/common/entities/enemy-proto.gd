class_name Enemy extends Entity

@export var params:PSMParams

@onready var p_state_machine = $PStateMachine
@onready var player_ref = get_tree().get_root().get_node("res://scenes/actors/player/player.tscn")

func _get_movement_direction():
	var result:Vector3 = Vector3.ZERO
	result += position.direction_to(player_ref.position)
	return result
