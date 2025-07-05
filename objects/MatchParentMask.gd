extends CollisionObject2D

func _ready() -> void:
	collision_layer = get_parent().collision_layer
	collision_mask = get_parent().collision_mask
