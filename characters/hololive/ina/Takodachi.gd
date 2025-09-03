class_name Takodachi 
extends Character

@export var healing = 3

func _process(delta: float) -> void:
	super._process(delta)

func get_role():
	return "Healing Support"

func get_fandom():
	return "Ninomae Ina'nis (Hololive)"
	
func get_description():
	return "To show their love and affection for Ina'nis, they Summon Little hearts around the map that can be picked up by units to be healed"

func get_role_skill_name():
	return "Healing:"

func get_role_skill_value():
	return str(healing) + " Per Orb"
	
func get_character_nane():
	return "Takodachi"

func do_action():
	var heal_orb = load('res://objects/Heal.tscn').instantiate()
	heal_orb.healing = healing
	heal_orb.set_collision_mask_value(Character.HIT_BOX_LAYER, true)
	heal_orb.position = Vector2(randf(), randf()) * World.current.world_size
	World.current.objects.add_child(heal_orb)
