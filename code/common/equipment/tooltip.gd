extends Control

@onready var name_label = $TextureRect/VBoxContainer/MarginContainer/ColorRect/MarginContainer2/ColorRect2/Label
@onready var pros_label = $TextureRect/VBoxContainer/MarginContainer2/ColorRect/MarginContainer2/ColorRect2/MarginContainer3/VBoxContainer/Label
@onready var cons_label = $TextureRect/VBoxContainer/MarginContainer2/ColorRect/MarginContainer2/ColorRect2/MarginContainer3/VBoxContainer/Label2
@onready var info_label = $TextureRect/VBoxContainer/MarginContainer2/ColorRect/MarginContainer2/ColorRect2/MarginContainer3/VBoxContainer/Label3

func set_texts(item:ChrysItem):
	name_label.text = item.item_name
	var pros = ""
	var cons = ""
	var info = ""
	var ingredients: Array[ChrysItem] = Array(item.ingredients)
	ingredients.append(item)
	
	for ingredient in ingredients:
		for line in ingredient.item_description.split('\n'):
			if line[0] == '+':
				pros += line + "\n"
			elif line[0] == '-':
				cons += line + "\n"
			else:
				info += line + "\n"
	do_labels(pros, cons, info)

func do_labels(pros:String, cons:String, info:String):
	pros_label.show()
	cons_label.show()
	info_label.show()
	if pros == "":
		pros_label.hide()
	if cons == "":
		cons_label.hide()
	if info == "":
		info_label.hide()
	pros_label.text = pros
	cons_label.text = cons
	info_label.text = info
