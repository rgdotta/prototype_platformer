extends CharacterBody2D
class_name Player

@export var move_speed := 150
@export var jump_speed := -175.0

var acceleration := move_speed / 20
var friction := acceleration * 15

enum FACING_DIRECTIONS { LEFT = -1, RIGHT = 1 }
var facing_direction := FACING_DIRECTIONS.RIGHT

const ABILITY_ACTION_START_ID := 100
enum MODULAR_ACTIONS { 
	DOUBLE_JUMP, 
	DASH, 
	ATTACK = ABILITY_ACTION_START_ID 
}
	
var equiped_modular_actions = {
	"action_1": MODULAR_ACTIONS.DASH,
	"action_2": MODULAR_ACTIONS.DOUBLE_JUMP,
	"action_3": null
}

var apply_gravity = true

func _physics_process(delta: float) -> void:
	if not is_on_floor() && apply_gravity:
		velocity.y += World.GRAVITY * delta

	move_and_slide()

func equiped_modular_action_key(action_name):
	return equiped_modular_actions.find_key(action_name)
	
func face_right():
	facing_direction = FACING_DIRECTIONS.RIGHT
	
func face_left():
	facing_direction = FACING_DIRECTIONS.LEFT

func is_falling():
	return velocity.y > 0
