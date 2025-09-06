class_name Explosion
extends StaticObject

@export var damage = 20
@export var explosion_existance = 1

func _ready() -> void:
	$Explosion_Body.explosion_existance = explosion_existance

func _process(delta: float) -> void:
	if is_equal_approx($Explosion_Body.modulate.a, 0):
		queue_free()

func deal_damage(body):
	body.take_damage(damage)
