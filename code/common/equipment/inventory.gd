extends Node

var general_inv: Array[ChrysItem]
var equipped_items: Array[ChrysItem]
var itemDB: Array[ChrysItem]

func _ready():
	for item in DirAccess.get_files_at("res://scenes/items/"):
		itemDB.append(load("res://scenes/items/" + item))

func remove(i: int):
	if i >= general_inv.size():
		return null
	elif general_inv[i].quantity == 1:
		var tmp = general_inv[i]
		general_inv.remove_at(i)
		return tmp
	else:
		general_inv[i].quantity -= 1
		return general_inv[i]
		
func obtain(new_item: ChrysItem):
	if new_item.ingredients.size() == 0:
		for item in general_inv:
			if item.item_name == new_item.item_name:
				item.quantity += 1
				return
	
	new_item.quantity = 1
	general_inv.append(new_item)
