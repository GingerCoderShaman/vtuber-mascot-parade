class_name Gecko
extends Character

var fireball = preload("res://characters/indie/zentraya/fireball.tscn")

@export
var damage_per_ball = .75;

@export 
var fireball_velocity = 700

@export
var fireballs_cooldown = .1

@export
var fireball_min_size = .02

@export 
var fireball_max_size = 1.5

@export
var fireball_cooldown_cost = .4

@export 
var danger_zone = 140

@export
var fireball_lifetime = 1.25

var fireball_active = false
var cooldown = 0

func get_role():
	return "Melee Damage Dealer"

func get_fandom():
	return "Zentreya"
	
func get_description():
	return "Zentreya Geckos all have the ability to breath fire, and do so on close by enemies"
	
func get_role_skill_name():
	return "Damage:"

func get_role_skill_value():
	return str(damage_per_ball / fireballs_cooldown) + " Per second"

func get_character_nane():
	return "Gecko"
	
func process_actions(delta:float):
	super.process_actions(delta)
	var closest_enemy = World.current.get_closest_enemy(position)
	
	if closest_enemy == null:
		fireball_active = false
		return

	if fireball_active:
		fireball_spout(delta, closest_enemy)
		return
	if haste_countdown < .01 && position.distance_to(closest_enemy.position) < danger_zone:
		fireball_active = true
		print('fireball is now active')

func fireball_spout(delta:float, enemy):
	cooldown -= delta
	if cooldown <= 0:
		cooldown = fireballs_cooldown
		var direction_to = Vector2(cos(angle), sin(angle)) * global_scale 
		var fireball = fireball.instantiate()
		fireball.origin_velocity = direction_to
		fireball.damage = damage_per_ball
		fireball.angle = position.angle_to_point(enemy.position)
		fireball.position = position
		fireball.min_size = fireball_min_size
		fireball.max_size = fireball_max_size
		fireball.lifetime = fireball_lifetime
		World.current.objects.add_child(fireball)
		haste_countdown += fireball_cooldown_cost
		if haste_countdown >= haste:
			haste_countdown = haste
			fireball_active = false

func do_action():
	haste_countdown = 0
