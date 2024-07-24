class_name Player extends Entity

@export var params:PSMParams

@onready var p_state_machine = $PStateMachine

func _ready():
	p_state_machine.pull_params.connect(swap_params)
	p_state_machine.params = self.params.duplicate()
	p_state_machine.params_clean = self.params.duplicate()

func swap_params(clean_params: PSMParams):
	p_state_machine.params = self.params.duplicate()
	self.params = clean_params.duplicate()
