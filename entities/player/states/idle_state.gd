extends MovementState

func enter() -> void:
	super()
	parent.velocity.x = 0

func physics_update(delta: float) -> void:
	if direction() != 0:
		state_machine.change_state("MoveState")

func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept") and parent.is_on_floor():
		state_machine.change_state("JumpState")
