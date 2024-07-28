class_name Entity extends CharacterBody3D

@export var element: Constants.ELEMENTS
@export var skeleton_type: String
@export var max_health: int
@export var StateMachineParameters: PSMParams
@export var my_equipment: Array[ChrysItem]

var current_health: int
var current_anim: String
var num_hazards: int
var signals_in_use: Array[String]

@onready var sprite_3d = $Sprite3D
@onready var area_3d = $Area3D
@onready var mySkeleton = $Sprite3D/SubViewport/skeleton_root
@onready var state_machine = $PStateMachine

func _ready():
	for armor in my_equipment:
		equip(load(armor.path_to_scene).instantiate)
	
	area_3d.area_entered.connect(update_collisions.bind(1))
	area_3d.area_exited.connect(update_collisions.bind(-1))
	
	state_machine.pull_params.connect(swap_params)
	state_machine.params = self.params.duplicate()
	state_machine.params_clean = self.params.duplicate()

func swap_params(clean_params: PSMParams):
	state_machine.params = self.params.duplicate()
	self.params = clean_params.duplicate()

func update_collisions(attack:Area3D, x:int):
	if attack.get_parent().get_parent() == self:
		return

	num_hazards += x

func broadcast(event: String, args: Array):
	if event in signals_in_use:
		self.emit_signal(event, args)

func equip(item: Equipment):
	for sig in item.listeners:
		if sig not in signals_in_use:
			self.add_user_signal(sig)
			signals_in_use.append(sig)
		
		self.connect(sig, Callable(item, sig + "_triggered"))
	for child in item.get_children():
		if child is Sprite2D:
			child.queue_free()
	self.add_child(item)
	
	if item is EquipmentHelm:
		$Sprite3D/SubViewport/skeleton_root.swap_helmet(item)
	elif item is EquipmentArmor:
		$Sprite3D/SubViewport/skeleton_root.swap_armor(item)
	elif item is EquipmentBoots:
		$Sprite3D/SubViewport/skeleton_root.swap_boots(item)
	elif item is EquipmentWeapon:
		$Sprite3D/SubViewport/skeleton_root.swap_arm(item, 0)
		$Sprite3D/SubViewport/skeleton_root.swap_arm(item, 1)
		
func unequip(item: Equipment):
	self.remove_child(item)
	item.queue_free()

func animate(anim_name:String):
	if anim_name != current_anim:
		mySkeleton.play_anim(skeleton_type + "/" + anim_name)

func _physics_process(_delta):
	if self.velocity.x < 0:
		self.scale.x = -1
	if self.velocity.x > 0:
		self.scale.x = 1
	move_and_slide()

func _aim_at_point():
	pass

func _wants_to_jump():
	pass

func _get_movement_direction():
	pass

func _take_damage() -> void:
	pass
