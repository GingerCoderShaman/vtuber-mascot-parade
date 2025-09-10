class_name EnemyWave
extends Resource

@export var spawn_time = 1.5

@export var wave_name = ""

func has_next() -> bool:
	return false
	
func next_enemey() -> Enemy:
	return null

func reset():
	pass
