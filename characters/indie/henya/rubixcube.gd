class_name rubix_cube
extends Character

@export var damage = 20

func do_action():
	if tracked_entities.size() == 0:
		haste_countdown = 0
		return
	%RubixcubeExplode.modulate.a = 1
	for entity in tracked_entities:
		entity.take_damage(damage)

	
