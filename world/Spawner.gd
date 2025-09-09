extends Node2D

@export var starting_spawn_time:float = 3.5

const WAVE_SPAWN_FINISHED = -1

var wave = -1
var current_spawn = WAVE_SPAWN_FINISHED

@export var waves:Array[EnemyWave]

@export var infinite = false

var in_wave_spawn_time = 0
@onready var remaining_spawn_time = starting_spawn_time

func find_spawns():
	var children = get_children()
	if children.size() == 0:
		print('ERROR, NO CHILDREN ON SPAWNER NODE TO SPAWN WITH')
		return []
	var player = %Player
	if children.size() == 1 || player.get_child_count() == 0:
		return children
	var head_player = player.get_child(0)
	
	var removing_child = null
	for child in children:
		if removing_child == null \
		|| removing_child.position.distance_to(head_player.position) > child.position.distance_to(head_player.position):
			removing_child = child
	children.erase(removing_child)
	return children

	
func _process(delta: float) -> void:
	if current_spawn != WAVE_SPAWN_FINISHED:
		in_wave_spawn_time -= delta
		if in_wave_spawn_time < 0:
			spawn_enemy()
		return
	if %Enemies.get_child_count() == 0:
		remaining_spawn_time -= delta
		if remaining_spawn_time < 0:
			wave += 1
			if wave == waves.size():
				if infinite:
					wave = 0
				else:
					return
			remaining_spawn_time = starting_spawn_time
			current_spawn = waves[wave].enemies.size() - 1

func spawn_enemy():
	var enemy = waves[wave].enemies[current_spawn].instantiate()
	var spawns_points = find_spawns()
	if spawns_points.size() == 0:
		return;
	var spawn_location = spawns_points.pick_random()
	
	enemy.position = spawn_location.position + ((randf()-.5) * spawn_location.scale)
	current_spawn -= 1;
	in_wave_spawn_time = waves[wave].spawn_time
	#enemy.angled_velocity = 100
	%Enemies.add_child(enemy)
		
