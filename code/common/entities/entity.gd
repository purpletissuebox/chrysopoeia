class_name Entity extends CharacterBody3D

@export var element: Constants.ELEMENTS
@export var skeleton_type: String
@export var max_health: int
var current_health: int
var current_anim: String

var signals_in_use: Array[String]

@onready var mySkeleton = $Sprite3D/SubViewport/skeleton_root

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

func animate(anim_name:String):
	if anim_name != current_anim:
		mySkeleton.play_anim(skeleton_type + "/" + anim_name)

func _physics_process(_delta):
	move_and_slide()

func _aim_at_point():
	pass

func _get_movement_direction():
	pass

func _take_damage() -> void:
	pass
