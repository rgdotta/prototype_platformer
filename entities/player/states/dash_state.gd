extends BaseMovementState

@onready var duration_timer: Timer = $DurationTimer

@export var dash_speed := 750
var dash_acceleration := dash_speed / 3.75
var dash_transition_threshold := dash_speed / 10
const DURATION_TIME = 0.05

func enter() -> void:
	duration_timer.one_shot = true
	duration_timer.start(DURATION_TIME)

func physics_update(delta: float) -> void:
	if duration_timer.is_stopped():
		move_on_x_axis(dash_acceleration, dash_acceleration)
	else:
		parent.velocity.x = move_toward(parent.velocity.x, dash_speed * parent.facing_direction, dash_acceleration)
	
	parent.move_and_slide()
	change_state_when_finished()

func handle_input(event: InputEvent) -> void:
	#handle_double_jump_input(event)
	handle_modular_action_inputs(event, [parent.MODULAR_ACTIONS.DOUBLE_JUMP])
	
func change_state_when_finished():
	if not duration_timer.is_stopped():
		return
	
	var is_near_parent_speed = abs(parent.velocity.x) <= parent.move_speed
	
	if parent.is_on_floor():
		if not_moving():
			state_machine.change_state("IdleState")
		elif is_near_parent_speed:
			state_machine.change_state("MoveState")
	elif is_near_parent_speed:
		state_machine.change_state("FallState")
