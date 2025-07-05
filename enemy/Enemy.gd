class_name Enemy
extends CharacterBody2D

const HIT_BOX_LAYER = 3

@export
var angle_speed = 3

@export
var health: int = 3

@onready
var current_health:int = health

@export
var enemy_velocity:float = 100

var angle = 0

func get_controller():
	return self

func take_damage(amount:int=1) -> bool:
	current_health -= amount
	if current_health < 0:
		queue_free()
	return true
