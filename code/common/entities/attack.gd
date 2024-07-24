class_name Attack extends Area3D

@export var element: Constants.ELEMENTS
@export var baseDmg: float
@export var attacker: Entity

func hit_something(other_guy: Area3D):
	var defender:Entity = other_guy.get_parent()
	if defender == attacker:
		return
	attacker.broadcast(Constants.listeners[Constants.LISTENERS.SCOREDHIT], [attacker, self, defender])
	defender.broadcast(Constants.listeners[Constants.LISTENERS.WASHIT], [defender, self, attacker])
