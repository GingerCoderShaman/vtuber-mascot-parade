extends AnimatedSprite2D

@export
var animation_name = 'default'
	
@export
var direction = Character.FACING_DIRECTION.DOWN

@export var parent:Character

func _ready() -> void:
	play(animation_name)
	if parent == null:
		parent = get_parent();
		
func _process(delta: float) -> void:
	if direction != parent.facing_direction:
		visible = false
	else:
		visible = true
