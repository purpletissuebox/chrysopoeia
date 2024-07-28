class_name ChrysItem extends Resource

@export var item_name: String
@export_multiline var item_description: String
@export var element: Constants.ELEMENTS
@export var inventory_sprite: Texture2D
@export var path_to_scene: String
@export var ingredients: Array[ChrysItem]
var quantity: int
