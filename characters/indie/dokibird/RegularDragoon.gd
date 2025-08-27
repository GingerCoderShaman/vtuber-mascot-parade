class_name RegularDragoon
extends Character

var laser = preload('res://objects/FriendlyLaser.tscn')

func do_action():
	var enemy = null

	for target in World.current.enemies.get_children():
		if enemy == null || enemy.position.distance_to(position) > \
			target.position.distance_to(position):
			enemy = target
	if enemy == null:
		return

	var laser = laser.instantiate()
	laser.rotation = position.angle_to_point(enemy.position)
	laser.position = position
	World.current.objects.add_child(laser)
