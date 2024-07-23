extends State

const JUMP_SPEED = 3.0
const FALL_SPEED = -0.5
const GRAVITY = 5
const TOPSPEED = 2.0

func _enter(_parent: Entity)->void:
	pass
		
func _handle_input(_parent: Entity):
	if _parent.is_on_floor():
		return "walk"

func _act_on_parent(_parent: Entity, _delta: float)->void:
	if _parent.velocity.y < FALL_SPEED:
		_parent.animate("fall")
	elif _parent.velocity.y > -FALL_SPEED:
		_parent.animate("jump")
	else:
		_parent.animate("peak")
		
	var mvmnt: Vector3
	mvmnt.x = Input.get_axis("chrys_left", "chrys_right")
	mvmnt.z = Input.get_axis("chrys_up", "chrys_down")
	mvmnt = mvmnt.normalized()*TOPSPEED
	mvmnt.y = _parent.velocity.y - _delta*GRAVITY
	
	_parent.velocity = mvmnt

func _exit(_parent: Entity)->void:
	pass
