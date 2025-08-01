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
	move_to_angle(desired_angle, delta)

func process_effect(body, delta):
	delta *= rate
	if body.take_damage(delta*damage):
		take_damage(delta)
