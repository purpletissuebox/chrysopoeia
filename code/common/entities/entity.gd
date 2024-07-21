class_name Entity extends CharacterBody3D

@export var element: Constants.ELEMENTS

@export var max_health: int
var current_health: int
@export var max_mana: int
var current_mana: int
var position_xz: Vector2

var signals_in_use: Array[String]

func broadcast(event: String, args: Array):
	if event in signals_in_use:
		self.emit_signal(event, args)

func equip(item: Equipment):
	for sig in item.listeners:
		if sig not in signals_in_use:
			self.add_user_signal(sig)
			signals_in_use.append(sig)
		self.connect(sig, Callable(item, sig + "_triggered"))
		self.add_child(item)
		
func unequip(item: Equipment):
	self.remove_child(item)
	item.queue_free()

func _aim_at_point():
	pass

func _get_movement_direction():
	pass

func _take_damage() -> void:
	pass
