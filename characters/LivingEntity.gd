class_name LivingEntity
extends CharacterBody2D

@export var health: float = 5
@export var size: float = 6

@export
var angle_speed = 3
@export
var angled_velocity = 150

@onready var current_health = health
var angle = 0

var tracked_entities = []

func _process(delta):
	process_overlap_effect(delta)

func take_damage(amount:float=1) -> bool:
	current_health -= amount
	if current_health <= 0:
		queue_free()
	return true

func heal(amount:float=1) -> bool:
	if health <= current_health:
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
