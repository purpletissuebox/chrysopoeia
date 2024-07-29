extends Node

@export var mob : Entity
@export var global_limit : int = 0
@export var spawn_count  : int = 0
@export var helm_list    : Array[ChrysItem]
@export var armor_list   : Array[ChrysItem]
@export var boots_list   : Array[ChrysItem]
@export var weapons_list : Array[ChrysItem]

var equipment_list : Dictionary = {
	"helms": helm_list,
	"armor": armor_list,
	"boots": boots_list,
	"weapons": weapons_list,
}
@onready var spawn_point = $Marker3D.position
@onready var rng = RandomNumberGenerator.new()

func pick_equipment(key:String, dict:Dictionary)->ChrysItem:
	return equipment_list[key][rng.randi_range(0,len(equipment_list[key]))]

func generate_equipment()->Array[ChrysItem]:
	var equipment : Array[ChrysItem]
	for key in equipment_list.keys():
		equipment += [pick_equipment(key, equipment_list)]
	
	return equipment
		
func spawn_mob():
	if spawn_count == global_limit:
		return
	
	var newborn = mob.instantiate()
	newborn.myequipment += generate_equipment()
	newborn.position = spawn_point
	add_child(newborn)
	spawn_count += 1
