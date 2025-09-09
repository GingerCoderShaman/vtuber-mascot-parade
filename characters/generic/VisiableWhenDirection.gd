extends Node2D

@export
var direction = Character.FACING_DIRECTION.DOWN

@export var parent:Character

func _ready() -> void:
	if parent == null:
		parent = get_parent();
		
func _process(delta: float) -> void:
	if direction != parent.facing_direction:
		visible = false
	else:
		visible = true
