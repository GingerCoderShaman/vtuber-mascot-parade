class_name Laser
extends CharacterBody2D

@export
var laser_velocity:float = 150

@export
var lifetime:float = 10

@export
var damage:int = 1

@onready
var remaining_lifetime:float = lifetime

var angle:
	get: 
		return rotation
	set(value):  
		rotation = value

func _process(delta: float) -> void:
	var direction_to = Vector2(cos(angle), sin(angle)) * delta * laser_velocity
	position += direction_to
	remaining_lifetime -= delta
	
	self.modulate.a = (remaining_lifetime/lifetime)
	
	if remaining_lifetime < 0:
		queue_free()

func get_controller():
	return self

func take_damage(_amount:int=1) -> bool:
	return false

func _on_area_2d_body_entered(body) -> void:
	if body.get_controller().take_damage(damage):
		queue_free()
