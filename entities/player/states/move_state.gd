extends BaseMovementState

func physics_update(delta: float) -> void:
	move_on_x_axis()
	parent.move_and_slide()
	
	change_state()

func handle_input(event: InputEvent) -> void:
	handle_jump_input(event)
	handle_modular_action_inputs(event, [parent.MODULAR_ACTIONS.DASH])

func change_state() -> void:
	if parent.is_falling():
		state_machine.change_state("FallState")
	elif not_moving():
		state_machine.change_state("IdleState")
