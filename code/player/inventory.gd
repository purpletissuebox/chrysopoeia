extends Control

var page: int = 0
var last_page: int
const ITEMS_PER_PAGE: int = 12

@onready var grid_container = $MarginContainer/GridContainer

func _ready():
	Inventory.obtain(Inventory.itemDB[0])
	Inventory.obtain(Inventory.itemDB[0])
	Inventory.obtain(Inventory.itemDB[1])
	Inventory.obtain(Inventory.itemDB[1])
	Inventory.obtain(Inventory.itemDB[1])
	Inventory.obtain(Inventory.itemDB[1])
	page = 0
	last_page = Inventory.general_inv.size() / ITEMS_PER_PAGE
	populate_slots()

func populate_slots():
	for i in range(ITEMS_PER_PAGE):
		var current_slot = grid_container.get_child(i)
		if page*ITEMS_PER_PAGE + i >= Inventory.general_inv.size():
			current_slot.contained_item = null
		else:
			current_slot.contained_item = Inventory.general_inv[page*ITEMS_PER_PAGE + i]
		current_slot.display()
