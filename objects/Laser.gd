class_name Laser
extends StaticObject

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

func take_damage(_amount:int=1) -> bool:
	return false

func heal(_amount:int=1) -> bool:
	return false

func _on_area_2d_body_entered(body) -> void:
	if body.take_damage(damage):
		queue_free()
