class_name EquipmentWeapon extends Equipment

@export var L_shoulder_attachment: Node2D
@export var L_elbow_attachment: Node2D
@export var L_wrist_attachment: Node2D
@export var L_hand_tip: Node2D
@export var R_shoulder_attachment: Node2D
@export var R_elbow_attachment: Node2D
@export var R_wrist_attachment: Node2D
@export var R_hand_tip: Node2D

@export var arm_L_img: Sprite2D
@export var forearm_L_img: Sprite2D
@export var hand_L_img: Sprite2D
@export var arm_R_img: Sprite2D
@export var forearm_R_img: Sprite2D
@export var hand_R_img: Sprite2D

@onready var weapon = $Area3D
var current_handedness: int

signal swing(pos)

func _init():
	listeners.append("swing")
	
	pass
	
func swing_triggered(args:Array):
	$Area3D.position = args[0]
	$Area3D.show()
	
func set_attacker(entity:Entity):
	weapon.attacker = entity
	
func _on_area_3d_area_entered(area):
	var entity = area.get_parent()
	if entity is Player:
		weapon.hit_something(entity.find_child("Area3D"))
		
