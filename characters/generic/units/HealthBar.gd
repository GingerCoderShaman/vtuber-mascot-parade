class_name HealthBar
extends Node2D

var parent

func _ready() -> void:
	parent = get_parent()
	$Bar.position.y = parent.size * 2
	$Bar.position.x = -parent.size * 2
	calc_scale()

func _process(_delta: float) -> void:
	calc_scale()

func calc_scale():
	var current_health = (parent.current_health/parent.health)
	if current_health > .90:
		modulate.a = 0
	else:
		modulate.a = 1
	$Bar.scale.x = parent.size * 4 * current_health
