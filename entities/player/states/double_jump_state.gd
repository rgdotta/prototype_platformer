extends JumpState

func is_jump_action_pressed():
	var action_key = parent.modular_action_key("DoubleJump")
	return Input.is_action_pressed(action_key)
	
func handle_input(event: InputEvent) -> void:
	pass
