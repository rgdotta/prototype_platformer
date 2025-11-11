extends CharacterBody2D
class_name Player

@export_category("Move")
@export var move_speed := 200
@export var acceleration := 7

@export_category("Jump")
@export var jump_speed := -175.0
@export var max_jump_time := 0.50
@export var air_control := 0.5
@export var apex_gravity_multiplier := 0.75

@export_category("Fall")
@export var fall_gravity_multiplier := 1.5

var modular_actions = {
	"action_1": "Dash",
	"action_2": "DoubleJump",
	"action_3": null
}

var apply_gravity = true

func _physics_process(delta: float) -> void:
	if not is_on_floor() && apply_gravity:
		velocity.y += World.GRAVITY * delta

	move_and_slide()

func modular_action_key(action_name):
	return modular_actions.find_key(action_name)
