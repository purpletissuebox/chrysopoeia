extends State

const JUMP_SPEED = 3.0

func _enter(_parent: Entity)->void:
	_parent.velocity.y = JUMP_SPEED
	_parent.animate("jump")
		
func _handle_input(_parent: Entity):
	return "air"

func _act_on_parent(_parent: Entity, _delta: float)->void:
	pass

func _exit(_parent: Entity)->void:
	pass
