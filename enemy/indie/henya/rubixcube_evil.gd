class_name rubix_cube_evil
extends Enemy

@export var damage = 20

func _process(delta: float) -> void:
	super._process(delta)
	if World.current.player.get_children().size() == 0:
		return
	var tail = World.current.player.get_child(0)
	var desired_angle = self.get_angle_to(tail.global_position)
	move_to_angle(desired_angle, delta)

func entity_entered(body: Node2D) -> void:
	queue_free()
	var explosion = load('res://objects/Explosion.tscn').instantiate()
	explosion.position = position
	World.current.objects.call_deferred("add_child", explosion)
