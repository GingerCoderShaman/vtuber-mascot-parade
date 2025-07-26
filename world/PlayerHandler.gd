class_name PlayerHandler
extends Node2D

@export var player_start = Vector2(0,0)


func start_player() -> void:
	for child in get_children():
		child.position = player_start
