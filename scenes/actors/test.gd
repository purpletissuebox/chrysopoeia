extends Node2D

@onready var mySkel = $skeleton_root

var no_helmet = load("res://scenes/equipment/default/helmet.tscn").instantiate()
var no_boots = load("res://scenes/equipment/default/boots.tscn").instantiate()
var no_armor = load("res://scenes/equipment/default/armor.tscn").instantiate()
var no_wep = load("res://scenes/equipment/default/weapons.tscn").instantiate()
var chainmail = load("res://scenes/equipment/fire/armor.tscn").instantiate()

var toggle:int = 0

func _ready():
	
	mySkel.swap_armor(no_armor)
	mySkel.swap_helmet(no_helmet)
	mySkel.swap_boots(no_boots)
	mySkel.swap_arm(no_wep, 0)
	mySkel.swap_arm(no_wep, 1)
	
	mySkel.play_anim("humanoid/idle")

func change_armor():
	toggle = toggle ^ 1
	if toggle:
			mySkel.swap_armor(chainmail)
	else:
			mySkel.swap_armor(no_armor)
