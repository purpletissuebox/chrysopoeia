class_name PStateMachine extends PState

@export var initial_state: PState
@export var doll: Player
var params: PSMParams
var params_clean: PSMParams

signal pull_params

func _physics_process(delta):
	var x: PState = initial_state
	var y: PState
	
	while x != self:
		y = x._main(doll, params, delta)
		x = x.get_parent()
		if y != null && y != initial_state:
			pull_params.emit(params_clean)
			initial_state = y
			y._entry(doll, params)
			break
