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

func _physics_process(delta: float) -> void:
	var direction_to = Vector2(cos(angle), sin(angle)) * delta * global_scale * laser_velocity
	var collision_info = move_and_collide(direction_to)
	if collision_info:
		if collision_info.get_collider() is Enemy && collision_info.get_collider().take_damage(damage):
			queue_free()
			return
		var change = direction_to.bounce(collision_info.get_normal())
		angle = atan2(change.y, change.x)

func _process(delta: float) -> void:
	remaining_lifetime -= delta
	
	self.modulate.a = (remaining_lifetime/lifetime)
	
	if remaining_lifetime < 0:
		queue_free()

func take_damage(_amount:int=1) -> bool:
	return false

func heal(_amount:int=1) -> bool:
	return false
