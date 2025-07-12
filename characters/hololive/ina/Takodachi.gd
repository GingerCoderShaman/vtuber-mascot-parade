class_name Takodachi 
extends Character

func _process(delta: float) -> void:
	super._process(delta)

func do_action():
	var heal_orb = load('res://objects/Heal.tscn').instantiate()

	heal_orb.set_collision_mask_value(Character.HIT_BOX_LAYER, true)
	heal_orb.position = Vector2(randf(), randf()) * World.current.world_size
	World.current.objects.add_child(heal_orb)
