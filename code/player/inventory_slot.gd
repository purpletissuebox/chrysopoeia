class_name InventorySlot extends AspectRatioContainer

var contained_item: ChrysItem

@onready var item_texture = $TextureRect/HBoxContainer/Control2/Control5
@onready var label = $TextureRect/HBoxContainer/Control2/Control5/Label
@onready var tooltip = $TextureRect/HBoxContainer/Control2/Control6/Control

func _ready():
	tooltip.hide()

func display():
	if !contained_item:
		item_texture.texture = null
		update_number(0)
	else:
		item_texture.texture = contained_item.inventory_sprite
		update_number(contained_item.quantity)
		tooltip.set_texts(contained_item)

func update_number(quantity:int):
	if quantity <= 1:
		label.text = ""
	else:
		label.text = str(quantity)

func show_tooltip():
	if contained_item:
		tooltip.show()

func hide_tooltip():
	tooltip.hide()
