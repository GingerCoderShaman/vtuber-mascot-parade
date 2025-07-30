extends Character

@export var damage = 10

static var arm = preload("res://characters/indie/saba/kaniki_arm.tscn");

func _ready() -> void:
	super._ready()
	var left_arm = arm.instantiate()
	var right_arm = arm.instantiate()
	
	right_arm.scale = Vector2(-1, 1)
	
	add_child(left_arm)
	add_child(right_arm)

func _process(delta: float) -> void:
	super._process(delta)
	if in_game:
		rotation = angle + PI * .5
