extends Sprite2D

@export var rotation_speed = -5
@export var explosion_existance = 1

func _process(delta: float) -> void:
	visual_update(delta)
	
func visual_update(delta: float):
	rotate(delta * rotation_speed)
	if modulate.a != 0:
		modulate.a -= delta * explosion_existance
		if modulate.a < 0:
			modulate.a = 0
