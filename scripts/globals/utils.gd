extends Node

func enum_key_to_state_name(enum_key) -> String:
	var parts = enum_key.to_lower().split("_")
	for i in parts.size():
		parts[i] = parts[i].capitalize()
	return "".join(parts) + "State"
