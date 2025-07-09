extends Node2D

@export var spawn_time:float = 3.5

var remaining_spawn_time = spawn_time

func _process(delta: float) -> void:
	remaining_spawn_time -= delta
	
	if remaining_spawn_time < 0:
		var tako = load([
			"res://enemy/hololive/ina/AngryTakodachi.tscn",
			"res://enemy/indie/dokibird/AngryDragoon.tscn"
			].pick_random()).instantiate()
		
		tako.global_position = global_position
		tako.angled_velocity = 100
		World.current.enemies.add_child(tako)
		remaining_spawn_time = spawn_time
		
