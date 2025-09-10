class_name RandomizedEnemyWave
extends EnemyWave

@export
var enemies: Array[PackedScene]

@export
var spawn_count = 5

var current = -1


func has_next() -> bool:
	return current != spawn_count
	
func next_enemey() -> Enemy:
	current += 1
	return enemies.pick_random().instantiate()

func reset():
	current = 0
