class_name AngryDragoon
extends Enemy

@export
var damage = 2

@export
var rate = 10

func _process(delta: float) -> void:
	super._process(delta)
	if World.current.player.get_children().size() == 0:
		return
	var tail = World.current.player.get_child(0)
	var desired_angle = self.get_angle_to(tail.global_position)
	angle = rotate_toward(angle, desired_angle, angle_speed * delta)
	var direction_to = Vector2(cos(angle), sin(angle)) * delta * angled_velocity
	position += direction_to

func process_effect(body, delta):
	delta *= rate
	if body.take_damage(delta*damage):
		take_damage(delta)
