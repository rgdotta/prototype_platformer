extends BaseMovementState

const FALL_GRAVITY_MULTIPLIER := 1.5

func physics_update(delta: float) -> void:
	move_on_x_axis()	
	parent.velocity.y += World.GRAVITY * delta * FALL_GRAVITY_MULTIPLIER
	parent.move_and_slide()
	
	change_state()
	
func handle_input(event: InputEvent) -> void:
	handle_modular_action_inputs(event, [parent.MODULAR_ACTIONS.DOUBLE_JUMP])
	
func change_state() -> void:
	if not parent.is_on_floor():
		return
		
	if not_moving():
		state_machine.change_state("IdleState")
	else:
		state_machine.change_state("MoveState")
