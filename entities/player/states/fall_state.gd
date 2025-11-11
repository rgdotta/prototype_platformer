extends MovementState

func physics_update(delta: float) -> void:
	move_x()	
	parent.velocity.y += World.GRAVITY * delta * parent.fall_gravity_multiplier
	parent.move_and_slide()
	
	change_state()
	
func handle_input(event: InputEvent) -> void:
	var double_jump_action_key = parent.modular_action_key("DoubleJump")
	if double_jump_action_key && event.is_action_pressed(double_jump_action_key):
		state_machine.change_state("DoubleJumpState")
	
func change_state() -> void:
	if parent.is_on_floor():
		state_machine.change_state("IdleState" if is_stopping() else "MoveState")
