extends Node2D

@export var spawn_time:float = 3.5

@export var spawns:Array[PackedScene]

var remaining_spawn_time = spawn_time

func _process(delta: float) -> void:
	remaining_spawn_time -= delta
	
	if remaining_spawn_time < 0:
		var enemy = spawns.pick_random().instantiate()
		enemy.position = position
		enemy.angled_velocity = 100
		World.current.enemies.add_child(enemy)
		remaining_spawn_time = spawn_time
		
