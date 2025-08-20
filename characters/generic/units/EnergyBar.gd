class_name EnergyBar
extends Node2D

var _energy = 1
var _max_energy = 1
var parent

var energy:
	get: return _energy
	set(value): 
		_energy = value
		calc_scale()

var max_energy:
	get: return _max_energy
	set(value): 
		_max_energy = value
		calc_scale()

func _ready() -> void:
	parent = get_parent()
	$Bar.position.y = parent.size * 2 + %texture.scale.y * 100
	$Bar.position.x = -parent.size * 2
	calc_scale()

func calc_scale():
	var current_energy = (_energy/_max_energy)
	if current_energy > .98:
		modulate.a = 0
	else:
		modulate.a = 1
	$Bar.scale.x = parent.size * 4 * current_energy
