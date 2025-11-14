extends CharacterBody2D
class_name Projectile

@export var speed := 400.0
@export var lifetime := 2.0 
@onready var duration_timer: Timer = $DurationTimer
@onready var hitbox: Hitbox = $Hitbox

var direction := Vector2.ZERO

func _ready() -> void:
	duration_timer.start(0.5)

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(direction * speed  * delta)
	if collision:
		queue_free()

func launch(dir: Vector2) -> void:
	direction = dir.normalized()

func set_enemy_projectile():
	hitbox.set_collision_layer_value(3, false)
	
func set_player_projectile():
	hitbox.set_collision_layer_value(5, false)

func _on_hitbox_hit(hurtbox: Variant) -> void:
	queue_free()
	
