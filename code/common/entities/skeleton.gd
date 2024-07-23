extends Node2D

@onready var animation_player = $AnimationPlayer

@onready var pelvis_pivot = $pelvis_pivot
@onready var pelvis_graphic = $pelvis_pivot/pelvis_graphic
@onready var thigh_r_graphic = $pelvis_pivot/thigh_r_pivot/thigh_r_graphic
@onready var calf_r_graphic = $pelvis_pivot/thigh_r_pivot/calf_r_pivot/calf_r_graphic
@onready var foot_r_graphic = $pelvis_pivot/thigh_r_pivot/calf_r_pivot/foot_r_pivot/foot_r_graphic
@onready var thigh_l_graphic = $pelvis_pivot/thigh_l_pivot/thigh_l_graphic
@onready var calf_l_graphic = $pelvis_pivot/thigh_l_pivot/calf_l_pivot/calf_l_graphic
@onready var foot_l_graphic = $pelvis_pivot/thigh_l_pivot/calf_l_pivot/foot_l_pivot/foot_l_graphic
@onready var chest_graphic = $pelvis_pivot/chest_pivot/chest_graphic
@onready var head_graphic = $pelvis_pivot/chest_pivot/head_pivot/head_graphic
@onready var shoulder_l_graphic = $pelvis_pivot/chest_pivot/shoulder_l_pivot/shoulder_l_graphic
@onready var forearm_l_graphic = $pelvis_pivot/chest_pivot/shoulder_l_pivot/forearm_l_pivot/forearm_l_graphic
@onready var hand_l_graphic = $pelvis_pivot/chest_pivot/shoulder_l_pivot/forearm_l_pivot/hand_l_pivot/hand_l_graphic
@onready var shoulder_r_graphic = $pelvis_pivot/chest_pivot/shoulder_r_pivot/shoulder_r_graphic
@onready var forearm_r_graphic = $pelvis_pivot/chest_pivot/shoulder_r_pivot/forearm_r_pivot/forearm_r_graphic
@onready var hand_r_graphic = $pelvis_pivot/chest_pivot/shoulder_r_pivot/forearm_r_pivot/hand_r_pivot/hand_r_graphic

func play_anim(anim_name: String):
	animation_player.play(anim_name)

func swap_arm(weapon: EquipmentWeapon, arm: int):
	if !arm:
		set_up_bone_chain([shoulder_l_graphic, forearm_l_graphic, hand_l_graphic], [weapon.L_shoulder_attachment, weapon.L_elbow_attachment, weapon.L_wrist_attachment, weapon.L_hand_tip], [weapon.arm_L_img, weapon.forearm_L_img, weapon.hand_L_img])
	else:
		set_up_bone_chain([shoulder_r_graphic, forearm_r_graphic, hand_r_graphic], [weapon.R_shoulder_attachment, weapon.R_elbow_attachment, weapon.R_wrist_attachment, weapon.R_hand_tip], [weapon.arm_R_img, weapon.forearm_R_img, weapon.hand_R_img])

func swap_helmet(helmet: EquipmentHelm):
	swap_limb_graphic(head_graphic, helmet.neck_attachment, helmet.head_tip, helmet.head_img)

func swap_boots(boots: EquipmentBoots):
	set_up_bone_chain([thigh_l_graphic, calf_l_graphic, foot_l_graphic], [boots.L_hip_attachment, boots.L_knee_attachment, boots.L_ankle_attachment, boots.L_foot_tip], [boots.leg_L_img, boots.calf_L_img, boots.foot_L_img])
	set_up_bone_chain([thigh_r_graphic, calf_r_graphic, foot_r_graphic], [boots.R_hip_attachment, boots.R_knee_attachment, boots.R_ankle_attachment, boots.R_foot_tip], [boots.leg_R_img, boots.calf_R_img, boots.foot_R_img])

func swap_armor(armor: EquipmentArmor):
	pelvis_pivot.position.y = -armor.height
	set_up_bone_multi(pelvis_graphic, armor.root_attachment, armor.spine_attachment, [armor.leg_l_attachment, armor.leg_r_attachment, armor.spine_attachment], armor.pelvis_img)
	set_up_bone_multi(chest_graphic, armor.spine_attachment, armor.neck_attachment, [armor.neck_attachment, armor.arm_l_attachment, armor.arm_r_attachment], armor.chest_img)

func set_up_bone_chain(bones:Array[Sprite2D], chain:Array[Node2D], graphics:Array[Sprite2D]):
	var i:int = 0
	while i < bones.size()-1:
		set_up_bone_single(bones[i], chain[i], chain[i+1], graphics[i])
		i += 1
	swap_limb_graphic(bones[i], chain[i], chain[i+1], graphics[i])

func set_up_bone_multi(bone:Sprite2D, start:Node2D, end:Node2D, hardpoints:Array[Node2D], graphic:Sprite2D):
	swap_limb_graphic(bone, start, end, graphic)
	
	if !hardpoints.is_empty():
		var i:int = 0
		var f:float = (end.position - start.position).angle()
		for sibling in bone.get_parent().get_children():
			if sibling != bone:
				sibling.position = (hardpoints[i].position - start.position).rotated(-f)
				i += 1

func set_up_bone_single(bone:Sprite2D, start:Node2D, end:Node2D, graphic:Sprite2D):
	swap_limb_graphic(bone, start, end, graphic)
	
	var sibling:Node2D = bone.get_parent().get_child(1)
	sibling.position = Vector2.RIGHT * (end.position - start.position).length()

func swap_limb_graphic(bone:Sprite2D, start:Node2D, end: Node2D, img:Sprite2D):
	var bv: Vector2 = end.position - start.position
	var gv: Vector2 = img.position - start.position
	
	bone.texture = img.texture
	bone.rotation = -bv.angle()
	bone.offset = gv
