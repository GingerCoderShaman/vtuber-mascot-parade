class_name Rufficans
extends Character

var ruffians = preload("res://characters/hololive/fuwamoco/Ruffians.tscn")

@export
var damage = 5

@export 
var attack_haste = 2

@export
var damage_range = 2

@export
var time_left = 20

@export
var in_parade = true

func _ready() -> void:
	super._ready()
	if randi() % 2 == 0:
		%Pink.visible = true
		%Blue.visible = false
	else:
		%Blue.visible = true
		%Pink.visible = false
		

func process_movement(delta: float) -> void:
	if in_parade:
		super.process_movement(delta)
		return
	time_left -= delta
	if time_left < 0:
		queue_free()
		return

	var target = World.current.get_closest_enemy(position)
	if target == null:
		var last_parent = World.current.player.get_child_count()
		if last_parent != 0:
			target = World.current.player.get_child(last_parent-1)
	if target:
		var desired_direction = target.position - position
		desired_direction = desired_direction.normalized()
		if(!desired_direction.is_zero_approx()):
			var desired_angle = atan2(desired_direction.y, desired_direction.x)
			angle = rotate_toward(angle, desired_angle, angle_speed * delta)

		var direction_to = Vector2(cos(angle), sin(angle)) * delta * angled_velocity * global_scale 

		var collision_info = move_and_collide(direction_to)
		if collision_info:
			var change = direction_to.bounce(collision_info.get_normal())
			angle = atan2(change.y, change.x)

func get_role():
	return "Damage Dealer"

func get_fandom():
	return "FUWAMCOCO"
	
func get_description():
	return "Ruffians always bring a friend to a fight, and the friend will go out and attack enemies"
	
func get_role_skill_name():
	return "Dmg:"

func get_role_skill_value():
	return str(damage)

func get_character_nane():
	return "Ruffians"

func do_action():
	if in_parade:
		var dog = ruffians.instantiate()
		dog.damage = damage
		dog.haste = attack_haste
		dog.in_parade = false
		dog.time_left = time_left
		dog.position = position
		World.current.objects.add_child(dog)
	else:
		var enemy = World.current.get_closest_enemy(position)
		if enemy && enemy.position.distance_to(position) < damage_range:
			enemy.take_damage(damage)
		else:
			haste_countdown = 0
