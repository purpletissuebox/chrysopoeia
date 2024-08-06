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

@onready var weapon = $Attack
@onready var timer = $Timer if $Timer else null
@onready var wep_area = $Attack
var current_handedness: int

signal swing(pos)

func _init():
	listeners.append("swing")
	
	pass
	
	
func _physics_process(delta):
	if timer != null and timer.is_stopped():
		wep_area.find_child("CollisionShape3D").disabled = true
		
func swing_triggered(args:Array):
	wep_area.position = args[0]
	wep_area.find_child("CollisionShape3D").disabled = false
	timer.start()
	
func set_attacker(entity:Entity):
	weapon.attacker = entity
