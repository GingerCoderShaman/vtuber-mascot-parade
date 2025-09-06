class_name LivingEntity
extends CharacterBody2D

@export var health: float = 5
@export var size: float = 6

@export
var angle_speed = 3
@export
var angled_velocity:float = 105

var current_health
var angle = 0

@export var in_game = true

var tracked_entities = []

func _ready() -> void:
	current_health = health

func _process(delta):
	if in_game:
		process_overlap_effect(delta)

func move_to_angle(desired_angle: float, delta: float, ignore_physics:bool = false):
	angle = rotate_toward(angle, desired_angle, angle_speed * delta)
	var direction_to = Vector2(cos(angle), sin(angle)) * delta * angled_velocity * global_scale

	if ignore_physics || move_and_collide(Vector2.ZERO, true):
			position += direction_to
			return

	var collision_info = move_and_collide(direction_to)
	if collision_info:
		var change = direction_to.bounce(collision_info.get_normal())
		angle = atan2(change.y, change.x)

func take_damage(amount:float=1, _source = null) -> bool:
	current_health -= amount
	if current_health <= 0:
		queue_free()
	return true

func heal(amount:float=1) -> bool:
	if health < current_health || is_equal_approx(health, current_health):
		return false
	current_health = max(current_health + amount, health)
	return true

func process_overlap_effect(delta):
	var removes = []
	for entity in tracked_entities:
		if is_instance_valid(entity):
			process_effect(entity, delta)
		else:
			removes.append(entity)
	for remove in removes:
		tracked_entities.erase(remove)

func process_effect(_body, _delta):
	pass

func track_overlap(body):
	if body == self:
		return
	tracked_entities.append(body)

func untrack_overlap(body):
	if body == self:
		return
	tracked_entities.erase(body)
