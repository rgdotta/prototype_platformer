extends Node
class_name StateMachine

@export var initial_state: State
var current_state: State
var states := {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.state_machine = self
			child.parent = get_parent()
	
	change_state(initial_state.name)

func _process(delta: float) -> void:
	current_state.update(delta)

func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)

func _input(event: InputEvent) -> void:
	current_state.handle_input(event)

func change_state(new_state_name: String) -> void:
	if not states.has(new_state_name):
		push_warning("State '%s' not found" % new_state_name)
		return
	
	if current_state:
		current_state.exit()
		
	current_state = states[new_state_name]
	print(current_state)
	current_state.enter()
