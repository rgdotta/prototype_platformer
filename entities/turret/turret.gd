extends RigidBody2D
class_name Turret

@export var range: float = 250.0
@export var fire_rate: float = 0.6
@export var projectile_scene: PackedScene

var cooldown := 0.0

func _physics_process(delta: float) -> void:
	cooldown = max(cooldown - delta, 0.0)

	shoot_if_ready()

func shoot_if_ready() -> void:
	if cooldown > 0:
		return

	cooldown = fire_rate
	fire_projectile()

func fire_projectile() -> void:
	if projectile_scene == null:
		return

	var projectile: Projectile = projectile_scene.instantiate()
	get_parent().add_child(projectile)

	projectile.set_enemy_projectile()
	projectile.global_position = global_position
	projectile.launch(Vector2.RIGHT.rotated(rotation))
