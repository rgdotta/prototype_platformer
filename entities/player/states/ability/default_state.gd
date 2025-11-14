extends BaseAbilityState

func handle_input(event: InputEvent) -> void:
	handle_modular_action_inputs(event, [parent.MODULAR_ACTIONS.SHIELD])
