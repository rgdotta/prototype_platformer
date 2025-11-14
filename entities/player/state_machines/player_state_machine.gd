extends StateMachine
class_name PlayerStateMachine

var modular_action_states := {}

func _ready() -> void:
	super()
	
	for action_key in get_parent().MODULAR_ACTIONS:
		var action = get_parent().MODULAR_ACTIONS[action_key]
		if is_correct_action_type(action):
			modular_action_states[action] = Utils.enum_key_to_state_name(action_key)

func change_to_modular_action_state(action):
	change_state(modular_action_states[action])

func is_correct_action_type(action):
	return false
