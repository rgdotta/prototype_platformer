extends Node2D
class_name Projectile

@export var speed := 400.0
@export var lifetime := 2.0 
@onready var duration_timer: Timer = $DurationTimer
@onready var hitbox: Hitbox = $Hitbox

var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	duration_timer.start(0.5)

func _process(delta: float) -> void:
	global_position += direction * speed * delta

func launch(dir: Vector2) -> void:
	direction = dir.normalized()

func _on_duration_timer_timeout() -> void:
	queue_free()
	
func set_enemy_projectile():
	hitbox.set_collision_layer_value(3, false)
	
func set_player_projectile():
	hitbox.set_collision_layer_value(5, false)

func _on_hitbox_hit(hurtbox: Variant) -> void:
	queue_free()
