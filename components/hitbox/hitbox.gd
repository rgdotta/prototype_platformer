extends Area2D
class_name Hitbox

signal hit(hurtbox)

func _ready():
	area_entered.connect(_on_area_entered)

func _on_area_entered(area):
	if area is Hurtbox:
		hit.emit(area)
