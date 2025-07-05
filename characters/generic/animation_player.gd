extends AnimatedSprite2D

@export
var animation_name = 'default'

func _ready() -> void:
	play(animation_name)
	
