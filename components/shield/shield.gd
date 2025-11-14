extends Node2D

@onready var collision: CollisionShape2D = $Collision
@onready var visual: ColorRect = $Visual
@onready var hurtbox: Hurtbox = $Hurtbox

var target

func _ready() -> void:
	if !target:
		target = get_parent()
	
	target.hurtbox.disable_collision()

	if target is Player:
		set_player_shield()
	else:
		set_enemy_shield()

func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	if target:
		self.global_position = target.global_position

func finish():
	target.hurtbox.enable_collision()
	queue_free()

func set_enemy_shield():
	hurtbox.set_collision_mask_value(5, false)
	
func set_player_shield():
	hurtbox.set_collision_mask_value(3, false)

func _on_hurtbox_hurt(hitbox: Variant) -> void:
	print("hit shield")
