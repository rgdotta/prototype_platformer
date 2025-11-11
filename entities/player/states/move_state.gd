extends MovementState

func physics_update(delta: float) -> void:
	move_x()
	parent.move_and_slide()
	
	if is_stopping():
		state_machine.change_state("IdleState")
		return

func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept") and parent.is_on_floor():
		state_machine.change_state("JumpState")
