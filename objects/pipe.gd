class_name Pipe
extends StaticObject

@export var fade_speed = 1

func _process(delta: float) -> void:
	modulate.a -= delta * fade_speed
	if (modulate.a < 0):
		queue_free()
