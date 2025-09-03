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

func get_role():
	return "Explosive Defensive DPS"

func get_fandom():
	return "Henya The Genius"
	
func get_description():
	return "Due to the fear of disapointing the True Genius of vtubers, they explodes when enemies come near, out of fear of being solved, Dayo"

func get_role_skill_name():
	return "Damage:"

func get_role_skill_value():
	return str(damage) + " On Explosion"
	
func get_character_nane():
	return "Henya's Rubic's Cube"
