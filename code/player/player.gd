class_name Player extends Entity

@export var params:PSMParams

@onready var p_state_machine = $PStateMachine


signal was_hit


func _init():
	signals_in_use += ["was_hit"]
	self.my_equipment = Inventory.equipped_items


func _aim_at_point():
	pass

func _wants_to_jump():
	return Input.is_action_just_pressed("chrys_jump")

func _get_movement_direction():
	var result:Vector2 = Vector2.ZERO
		
	result.x = Input.get_axis("chrys_left", "chrys_right")
	result.y = Input.get_axis("chrys_up", "chrys_down")
	return result
	
func _input(event):
	if event.is_action_pressed("chrys_lhand"):
		take_a_swing()
