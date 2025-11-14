extends PlayerStateMachine

func is_correct_action_type(action):
	return action >= get_parent().ABILITY_ACTION_START_ID
