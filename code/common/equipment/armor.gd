class_name  EquipmentArmor extends Equipment

@export var root_attachment: Node2D
@export var spine_attachment: Node2D
@export var neck_attachment: Node2D
@export var leg_l_attachment: Node2D
@export var leg_r_attachment: Node2D
@export var arm_l_attachment: Node2D
@export var arm_r_attachment: Node2D

@export var pelvis_img: Sprite2D
@export var chest_img: Sprite2D

@export var height: float = 1000

signal was_hit(args:Array)

func _init():
	listeners += ["was_hit"]

func _was_hit_triggered(args:Array):
	print("was hit")
	pass
