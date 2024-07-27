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
	equip(weap.instantiate())
	put_clothes_on = true

func _get_movement_direction():
	var result:Vector2 = Vector2.ZERO
	if !put_clothes_on:
		setup_equipment()

	if player_ref != null:
		result.x = position.direction_to(player_ref.position).x
		result.y = position.direction_to(player_ref.position).z
	
	return result
