class_name StateMachine extends Node

@export var initial_state: State
@export var parent: Entity

var current_state: State

func _ready():
	initial_state._init(parent)
	current_state = initial_state

func _process(delta):
	current_state._run(delta, parent)

func _physics_process(delta):
	current_state._physics_run(delta, parent)
	
func change_states(new_state: State):
	current_state._exit(parent)
	current_state = new_state
	current_state._init(parent)
	
