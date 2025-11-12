extends BaseMovementState

func enter() -> void:
	super()
	parent.velocity.x = 0

func physics_update(delta: float) -> void:
	if has_input_direction():
		state_machine.change_state("MoveState")

func handle_input(event: InputEvent) -> void:
	handle_jump_input(event)
	handle_modular_action_inputs(event, [parent.MODULAR_ACTIONS.DASH])
