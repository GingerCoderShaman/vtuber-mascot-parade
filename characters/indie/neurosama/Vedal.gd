class_name Vedal
extends Character

var pipe_scene = preload('res://objects/Pipe.tscn')

@export var damage = 2

func do_action():
	if World.current.enemies.get_child_count() == 0:
		return 
	var picked = World.current.enemies.get_children().pick_random()
	%AudioStreamPlayer2D.play()
	if picked.take_damage(damage):
		var pipe = pipe_scene.instantiate()
		pipe.position = picked.position
		pipe.scale = Vector2.ONE * 3
		World.current.objects.add_child(pipe)
