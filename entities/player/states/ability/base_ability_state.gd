extends State
class_name BaseAbilityState

func handle_modular_action_inputs(event: InputEvent, actions):
	for action in actions:
		var action_key = parent.equiped_modular_action_key(action)
		if action_key && event.is_action_pressed(action_key):
			state_machine.change_to_modular_action_state(action)
