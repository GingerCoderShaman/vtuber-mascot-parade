class_name AngryTakodachi
extends Enemy

func _process(delta: float) -> void:
	if World.current.player.get_children().size() == 0:
		return
	var tail = World.current.player.get_child(0)
	var desired_angle = self.get_angle_to(tail.global_position)
	angle = rotate_toward(angle, desired_angle, angle_speed * delta)
	var direction_to = Vector2(cos(angle), sin(angle)) * delta * enemy_velocity
	position += direction_to


func _on_area_2d_body_entered(body) -> void:
	if body.get_controller().take_damage():
		take_damage()
