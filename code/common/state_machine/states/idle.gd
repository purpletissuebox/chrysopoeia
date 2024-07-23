extends State

const FRICTION = 7.0

func _enter(_parent: Entity)->void:
	pass
	
func _handle_input(_parent: Entity):
	if !_parent.is_on_floor():
		return "air"
	elif Input.is_action_just_pressed("chrys_jump"):
		return "rise"
	elif Input.is_action_pressed("chrys_left") || Input.is_action_pressed("chrys_right") || Input.is_action_pressed("chrys_down") || Input.is_action_pressed("chrys_up"):
		return "walk"
	else:
		return null

func _act_on_parent(_parent: Entity, _delta: float)->void:
	_parent.velocity = _parent.velocity.move_toward(Vector3.ZERO, _delta*FRICTION)
	
	if _parent.velocity.x == 0:
		_parent.animate("idle")
	else:
		_parent.animate("skid")

func _exit(_parent: Entity)->void:
	pass
