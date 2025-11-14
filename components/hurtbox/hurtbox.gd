extends Area2D
class_name Hurtbox

@onready var collision: CollisionShape2D = $HurtboxCollision

signal hurt(hitbox)

func _ready():
	area_entered.connect(_on_area_entered)

func _on_area_entered(area):
	if area is Hitbox:
		hurt.emit(area)

func disable_collision():
	if collision:
		collision.disabled = true
	
func enable_collision():
	if collision:
		collision.disabled = false
