extends Node

@export var spawn_time:float = 1.5

var remaining_spawn_time = spawn_time

func _process(delta: float) -> void:
	remaining_spawn_time -= delta
	
	if remaining_spawn_time < 0:
		var tako = load("res://enemy/hololive/ina/AngryTakodachi.tscn").instantiate()
		
		tako.global_position = Vector2(200,200)
		add_child(tako)
		remaining_spawn_time = spawn_time
		
