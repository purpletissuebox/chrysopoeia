extends Node

@export var mob : Entity
@export var global_limit : int = 0
@export var self_limit : int = 0
@export var equipment_list : Dictionary = {
	"helms": Array[ChrysItem],
	"armor": Array[ChrysItem],
	"boots": Array[ChrysItem],
	"weapons": Array[ChrysItem],
}
@export var spawn_point : Vector3
@onready var rng = RandomNumberGenerator.new()

func pick_equipment(key:String, dict:Dictionary)->ChrysItem:
	return equipment_list[key][rng.randi_range(0,len(equipment_list[key]))]

func generate_equipment()->Array[ChrysItem]:
	var equipment : Array[ChrysItem]
	for key in equipment_list.keys():
		equipment += [pick_equipment(key, equipment_list)]
	
	return equipment
		
func spawn_mob():
	var newborn =  mob.instantiate()
	newborn.myequipment += generate_equipment()
	newborn.position = spawn_point
	add_child(newborn)
	
