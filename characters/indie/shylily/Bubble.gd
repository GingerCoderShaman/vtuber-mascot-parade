class_name Bubble
extends Node2D

@export var decay_rate = 1.0
@export var protection = 5.0
@onready var protection_remaining = protection
var parent

func _ready() -> void:
	parent = get_parent()
	World.current.player
	var player_parent = parent.get_parent()
	if player_parent is PlayerHandler:
		player_parent.damage_guard.append(self)
		
func _exit_tree() -> void:
	var player_parent = parent.get_parent()
	if player_parent is PlayerHandler:
		player_parent.damage_guard.erase(self)

func defend(amount:float=1, source = null):
	var result = protection_remaining - amount
	
	protection_remaining = max(0, result)
	
	return -result

func _process(delta: float) -> void:
	protection_remaining -= delta * decay_rate
	self.modulate.a = protection_remaining/protection
	
	if protection_remaining < 0:
		queue_free()
