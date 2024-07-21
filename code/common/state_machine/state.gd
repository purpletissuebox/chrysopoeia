class_name State extends Node

signal trigger_state_change(x: Entity)

func _enter(_parent: Entity)->void:
	pass
	
func _run(_delta: float, _parent: Entity)->void:
	pass

func _physics_run(_delta: float, _parent: Entity)->void:
	pass

func _exit(_parent: Entity)->void:
	pass
