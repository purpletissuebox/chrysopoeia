class_name Entity extends CharacterBody3D

@export var element: Constants.ELEMENTS

@export var max_health: int
var current_health: int
@export var max_mana: int
var current_mana: int

var position_xz: Vector2

func _aim_at_point():
	pass

func _get_movement_direction():
	pass

func _take_damage() -> void:
	pass
