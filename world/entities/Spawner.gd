extends Node2D

@export var starting_spawn_time:float = 3.5

var wave = 0

@export var waves:Array[EnemyWave]

@export var infinite = false

@onready var in_wave_spawn_time = starting_spawn_time
@onready var remaining_spawn_time = starting_spawn_time

func _ready() -> void:
	%EnemyWaveLabel.setup_warning(waves[wave].wave_name, starting_spawn_time)

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
	if waves[wave].has_next():
		in_wave_spawn_time -= delta
		if in_wave_spawn_time < 0:
			spawn_enemy()
		return
	if %Enemies.get_child_count() == 0:
		if wave+1 == waves.size():
			if infinite:
				wave = -1
			else:
				return
		%EnemyWaveLabel.setup_warning(waves[wave+1].wave_name, starting_spawn_time)
		remaining_spawn_time -= delta
		if remaining_spawn_time < 0:
			wave += 1
			remaining_spawn_time = starting_spawn_time
			waves[wave].reset()
func spawn_enemy():
	var spawns_points = find_spawns()
	var enemy = waves[wave].next_enemey()
	var spawn_location = spawns_points.pick_random()
	
	enemy.position = spawn_location.position + ((randf()-.5) * spawn_location.scale)
	
	in_wave_spawn_time = waves[wave].spawn_time
	#enemy.angled_velocity = 100
	%Enemies.add_child(enemy)
		
