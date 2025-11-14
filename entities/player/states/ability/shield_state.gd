extends BaseAbilityState

@export  var shield_scene: PackedScene
@onready var duration_timer: Timer = $DurationTimer

const DURATION_TIME := 1.0
var shield

func enter() -> void:
	duration_timer.one_shot = true
	duration_timer.start(DURATION_TIME)
	
	shield = shield_scene.instantiate()
	shield.target = parent
	add_child(shield)
	
func physics_update(delta: float) -> void:
	pass
	
func exit() -> void:
	shield.finish()
	
func _on_duration_timer_timeout():
	state_machine.change_state("DefaultState")	
