class_name StateMachine extends Node

@export var initial_state: State
@export var parent: Entity

var current_state: State

func _ready():
	enter_state(initial_state)

func _process(delta):
	current_state._run(delta, parent)

func _physics_process(delta):
	current_state._physics_run(delta, parent)
	
func change_states(new_state: State):
	leave_current_state()
	enter_state(new_state)

func leave_current_state():
	current_state._exit(parent)
	current_state.trigger_state_change.disconnect(self.change_states)

func enter_state(new_state: State):
	current_state = new_state
	current_state.trigger_state_change.connect(self.change_states)
	current_state._enter(parent)
