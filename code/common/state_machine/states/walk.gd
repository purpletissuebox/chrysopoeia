extends State

const TOPSPEED = 2.0
const ACCEL = 10.0

func _enter(_parent: Entity)->void:
	_parent.animate("walk")
		
func _handle_input(_parent: Entity):
	if !_parent.is_on_floor():
		return "air"
	elif Input.is_action_just_pressed("chrys_jump"):
		return "rise"
	elif !(Input.is_action_pressed("chrys_left") || Input.is_action_pressed("chrys_right") || Input.is_action_pressed("chrys_down") || Input.is_action_pressed("chrys_up")):
		return "idle"
	else:
		return null

func _act_on_parent(_parent: Entity, _delta: float)->void:
	var mvmnt: Vector3
	
	mvmnt.x = Input.get_axis("chrys_left", "chrys_right")
	mvmnt.y = 0
	mvmnt.z = Input.get_axis("chrys_up", "chrys_down")
	
	mvmnt = mvmnt.normalized()*TOPSPEED
	
	_parent.velocity = _parent.velocity.move_toward(mvmnt, _delta*ACCEL)

func _exit(_parent: Entity)->void:
	pass
