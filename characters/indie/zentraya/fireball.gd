class_name Fireball
extends StaticObject

@export 
var min_size = 0

@export
var max_size = 1;

@export
var fireball_velocity:float = 150

@export
var lifetime:float = 10

@export
var damage:float = 2

var origin_velocity = Vector2.ZERO

@onready
var remaining_lifetime:float = lifetime

var angle = 0.0

func _physics_process(delta: float) -> void:
	var direction_to = Vector2(cos(angle), sin(angle)) * delta * global_scale * fireball_velocity
	+ (origin_velocity * delta)
	position += direction_to

func on_fireball_enter(entity):
	if entity is LivingEntity:
		entity.take_damage(damage)

func _ready() -> void:
	scale = Vector2.ONE * ((max_size - min_size) * (1 - (remaining_lifetime/lifetime)) + min_size)

func _process(delta: float) -> void:

	remaining_lifetime -= delta
	
	scale = Vector2.ONE * ((max_size - min_size) * (1 - (remaining_lifetime/lifetime)) + min_size)

	if remaining_lifetime < 0:
		queue_free()

func take_damage(_amount:int=1, _source = null) -> bool:
	return false

func heal(_amount:int=1) -> bool:
	return false
