class_name RegularDragoon 
extends Character

func do_action():
	var laser = load('res://objects/Laser.tscn').instantiate()
	var enemy = null
	
	for target in World.current.enemies.get_children():
		if enemy == null || enemy.global_position.distance_to(global_position) > target.global_position.distance_to(global_position):
			enemy = target
	if enemy == null:
		return
	laser.set_collision_mask_value(Enemy.HIT_BOX_LAYER, true)
	laser.rotation = global_position.angle_to_point(enemy.global_position)
	laser.global_position = get_parent().global_position
	World.current.objects.add_child(laser)
