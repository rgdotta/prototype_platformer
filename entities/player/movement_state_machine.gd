extends StateMachine

var movement_modular_actions_states = {}

func _ready() -> void:
	super()
	
	for action_key in get_parent().MODULAR_ACTIONS:
		var action_value = get_parent().MODULAR_ACTIONS[action_key]
		if action_value < get_parent().ABILITY_ACTION_START_ID:
			movement_modular_actions_states[action_value] = Utils.enum_key_to_state_name(action_key)

func change_to_modular_action_state(action):
	change_state(movement_modular_actions_states[action])
