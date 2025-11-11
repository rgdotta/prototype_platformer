extends MovementState
class_name JumpState

func enter() -> void:
	parent.velocity.y = parent.jump_speed

func physics_update(delta: float) -> void:
	move_x()

	if is_jump_action_pressed():
		parent.velocity.y += delta * World.GRAVITY * -0.5

	if parent.velocity.y < 0 and abs(parent.velocity.y) < 100:
		parent.velocity.y *= parent.apex_gravity_multiplier
	
	parent.move_and_slide()
	change_state()

	
func handle_input(event: InputEvent) -> void:
	var double_jump_action_key = parent.modular_action_key("DoubleJump")
	if double_jump_action_key && event.is_action_pressed(double_jump_action_key):
		state_machine.change_state("DoubleJumpState")
	
func is_jump_action_pressed():
	return Input.is_action_pressed("ui_accept")
	
func change_state() -> void:
	if parent.velocity.y > 0:
		state_machine.change_state("FallState")
	elif parent.is_on_floor():
		state_machine.change_state("IdleState" if is_stopping() else "MoveState")
