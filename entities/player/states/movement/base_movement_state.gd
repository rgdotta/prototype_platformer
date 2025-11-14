extends State
class_name BaseMovementState

func input_direction():
	return Input.get_axis("move_left", "move_right")
	
func has_input_direction():
	return input_direction() != 0
	
func not_moving():
	return !has_input_direction() && parent.velocity.x == 0
	
func move_on_x_axis(acceleration = parent.acceleration, friction = parent.friction):
	if not_moving():
		parent.velocity.x = move_toward(parent.velocity.x, 0, friction)
	else:
		parent.velocity.x = move_toward(parent.velocity.x, parent.move_speed * input_direction(), acceleration)
		
	change_parent_facing_direction()

func change_parent_facing_direction():
	if parent.velocity.x != 0:
		if parent.velocity.x > 0:
			parent.face_right()
		else:
			parent.face_left()
			
func handle_jump_input(event: InputEvent):
	if event.is_action_pressed("jump") and parent.is_on_floor():
		state_machine.change_state("JumpState")
		
func handle_modular_action_inputs(event: InputEvent, actions):
	for action in actions:
		var action_key = parent.equiped_modular_action_key(action)
		if action_key && event.is_action_pressed(action_key):
			state_machine.change_to_modular_action_state(action)
