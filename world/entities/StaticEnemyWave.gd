class_name StaticEnemyWave
extends EnemyWave

@export
var enemies: Array[PackedScene]

var current = -1

func has_next() -> bool:
	return current+1 != enemies.size()
	
func next_enemey() -> Enemy:
	current += 1
	return enemies[current].instantiate()

func reset():
	current = -1
