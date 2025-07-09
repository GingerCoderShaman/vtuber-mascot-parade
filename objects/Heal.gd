class_name Heal
extends StaticObject

@export var healing = 3

var _angle = 0
var _velocity = 0

@export
var velocity_falloff = 12

@export
var velocity_shoot = 36

@export
var lifetime:float = 15

@onready
var remaining_lifetime:float = lifetime

var angle:
	get: 
		return _angle
	set(value): 
		_velocity = velocity_shoot
		_angle = value
		
func _process(delta: float) -> void:
	var direction_to = Vector2(cos(_angle), sin(_angle)) * delta * _velocity
	position += direction_to
	_velocity = max(0, _velocity-velocity_falloff*delta)
	
	remaining_lifetime-= delta
	self.modulate.a = (remaining_lifetime/lifetime)
	
	if remaining_lifetime < 0:
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.heal(healing):
		queue_free()
