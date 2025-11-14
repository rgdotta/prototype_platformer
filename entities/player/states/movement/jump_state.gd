extends BaseMovementState
class_name JumpState

const APEX_THRESHOLD = 100
const APEX_GRAVITY_MULTIPLIER = 0.75
const JUMP_PRESS_SPEED_MULTIPLIER = -0.5

func enter() -> void:
	parent.velocity.y = parent.jump_speed

func physics_update(delta: float) -> void:
	move_on_x_axis()

	if is_jump_action_pressed():
		parent.velocity.y += delta * World.GRAVITY * JUMP_PRESS_SPEED_MULTIPLIER

	if is_on_apex():
		parent.velocity.y *= APEX_GRAVITY_MULTIPLIER
	
	parent.move_and_slide()
	change_state()

func handle_input(event: InputEvent) -> void:
	handle_modular_action_inputs(event, [parent.MODULAR_ACTIONS.DASH, parent.MODULAR_ACTIONS.DOUBLE_JUMP])

func is_on_apex():
	return parent.velocity.y < 0 and abs(parent.velocity.y) < APEX_THRESHOLD
	
func is_jump_action_pressed():
	return Input.is_action_pressed("jump")
	
func change_state() -> void:
	if parent.is_falling():
		state_machine.change_state("FallState")
	elif parent.is_on_floor():
		if not_moving():
			state_machine.change_state("IdleState")
		else:
			state_machine.change_state("MoveState")
