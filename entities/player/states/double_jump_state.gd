extends JumpState

func is_jump_action_pressed():
	var action_key = parent.equiped_modular_action_key(parent.MODULAR_ACTIONS.DOUBLE_JUMP)
	return Input.is_action_pressed(action_key)
	
func handle_input(event: InputEvent) -> void:
	handle_modular_action_inputs(event, [parent.MODULAR_ACTIONS.DASH])
