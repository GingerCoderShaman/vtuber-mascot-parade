extends Node2D

@export var spawn_time:float = 3.5

@export var spawns:Array[PackedScene]

var remaining_spawn_time = spawn_time

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
	remaining_spawn_time -= delta
	
	if remaining_spawn_time < 0:
		var enemy = spawns.pick_random().instantiate()
		var spawns_points = find_spawns()
		if spawns_points.size() == 0:
			return;
		enemy.position = spawns_points.pick_random().position
		enemy.angled_velocity = 100
		World.current.enemies.add_child(enemy)
		remaining_spawn_time = spawn_time
		
