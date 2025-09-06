class_name Vedal
extends Character

var pipe_scene = preload('res://objects/Pipe.tscn')

@export var damage = 2

func get_role():
	return "Ranged DPS"

func get_fandom():
	return "Neuro-sama & Evil Neuro"

func get_description():
	return "Neurosama summons pipes to land on enemies to help protect Vedal"

func get_role_skill_name():
	return "Damage:"

func get_role_skill_value():
	return str(damage) + " Per Pipe"

func get_character_nane():
	return "Vedal, the turtle"

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
