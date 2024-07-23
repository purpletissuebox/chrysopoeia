class_name StateMachine extends Node

var state_listing: Array[State] = []
var current_state: State = null
var controlling_body: Entity

func _ready():
	controlling_body = get_parent()
	for child in get_children():
		add_state(child)
	current_state = state_listing[0]

func add_state(new_state: State):
	state_listing.push_back(new_state)

func enter_state(new_state_name: String):
	self.current_state._exit(controlling_body)
	for new_state in state_listing:
		if new_state.myName == new_state_name:
			self.current_state = new_state
	
	self.current_state._enter(controlling_body)

func _physics_process(delta):
	var next_state = current_state._handle_input(controlling_body)
	if next_state != null:
		enter_state(next_state)
	current_state._act_on_parent(controlling_body, delta)
