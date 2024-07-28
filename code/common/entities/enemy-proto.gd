class_name Enemy extends Entity

@export var params:PSMParams

@onready var p_state_machine = $PStateMachine
@onready var player_ref = get_parent().get_node("Player")

func _get_movement_direction():
	var result:Vector2 = Vector2.ZERO
	if !put_clothes_on:
		setup_equipment()

	if player_ref != null:
		var direction_to_player = player_ref.position-self.position
		if abs(direction_to_player.x) > 1.1 or abs(direction_to_player.z) > 1.1: 
			result.x = position.direction_to(player_ref.position).x
			result.y = position.direction_to(player_ref.position).z
		else:
			take_a_swing()
			
	return result

func take_a_swing():
	var weapon = find_child("EquipmentWeapon")
	self.broadcast("swing", [self.position])
	
