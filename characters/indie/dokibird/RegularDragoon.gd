class_name RegularDragoon
extends Character

var laser = preload('res://objects/FriendlyLaser.tscn')

@export var damage = 2

func get_role():
	return "Ranged Damage"

func get_fandom():
	return "Dokibird"
	
func get_description():
	return "From years of watching Dokibird while she was in 'retirement', they mastered the art of firing blue bolts that deal damage to enemies and bounce off walls, however, they lose damage over travel time"

func get_role_skill_name():
	return "Damage:"

func get_role_skill_value():
	return str(damage) + " Per Bolt"
	
func get_character_nane():
	return "Dragoon"

func do_action():	
	var enemy = World.current.get_closest_enemy(position)
	
	if !enemy:
		return

	var laser = laser.instantiate()
	laser.damage = damage
	laser.rotation = position.angle_to_point(enemy.position)
	laser.position = position
	World.current.objects.add_child(laser)
