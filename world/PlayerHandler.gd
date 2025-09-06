class_name PlayerHandler
extends Node2D

var damage_guard = []

func start_player() -> void:
	for child in get_children():
		child.position = position
	position = Vector2.ZERO
