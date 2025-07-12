class_name RegularDragoon
extends Character

func do_action():
	var enemy = null

	for target in World.current.enemies.get_children():
		if enemy == null || enemy.position.distance_to(position) > \
			target.position.distance_to(position):
			enemy = target
	if enemy == null:
		return

	var laser = load('res://objects/Laser.tscn').instantiate()
	laser.set_collision_mask_value(Enemy.HIT_BOX_LAYER, true)
	laser.rotation = position.angle_to_point(enemy.position)
	laser.position = position
	World.current.objects.add_child(laser)
