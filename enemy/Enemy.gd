class_name Enemy
extends LivingEntity

const HIT_BOX_LAYER = 3

func _ready() -> void:
	add_child(load("res://characters/generic/units/Healthbar.tscn").instantiate())

	
