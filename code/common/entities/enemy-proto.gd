class_name Enemy extends Entity

@export var params:PSMParams
@export var helm:PackedScene
@export var armor:PackedScene
@export var boots:PackedScene
@export var weap:PackedScene

@onready var p_state_machine = $PStateMachine
@onready var player_ref = get_parent().get_node("Player")

var put_clothes_on : bool = false

func setup_equipment():
	equip(helm.instantiate())
	equip(armor.instantiate())
	equip(boots.instantiate())
	
	var new_weap = weap.instantiate()
	equip(new_weap)
	new_weap.set_attacker(self)
	
	put_clothes_on = true

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
	#if weapon:
		#weapon.swing(self.position)
	self.broadcast("swing", [self.position])
	
