extends State
class_name MovementState

func direction():
	return Input.get_axis("ui_left", "ui_right")

func is_stopping():
	return direction() == 0
	
func move_x():
	if is_stopping():
		parent.velocity.x = move_toward(parent.velocity.x, 0, parent.acceleration)
	else:
		var to = parent.move_speed * direction() 
		if !parent.is_on_floor():
			to *= parent.air_control
	
		parent.velocity.x = move_toward(parent.velocity.x, to, parent.acceleration)
