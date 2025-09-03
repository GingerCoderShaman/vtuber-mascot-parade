extends Character

@export var damage = 10

static var arm = preload("res://characters/indie/saba/kaniki_arm.tscn");
var left_arm
var right_arm

func _ready() -> void:
	super._ready()
	var left_arm = arm.instantiate()
	var right_arm = arm.instantiate()
	
	right_arm.scale = Vector2(-1, 1)
	
	%BodyDirection.add_child(left_arm)
	%BodyDirection.add_child(right_arm)
	
func get_role():
	return "Melee DPS"

func get_fandom():
	return "Sameko Saba"
	
func get_description():
	return "Loyal Crab to Saba, They deal fiece pincher damage to anything that apporaches to the front of them."

func get_role_skill_name():
	return "Damage:"

func get_role_skill_value():
	return str(damage) + " Per Snap"
	
func get_character_nane():
	return "Kaniki (CrabBros)"

func do_action():
	haste_countdown = 0

func _process(delta: float) -> void:
	super._process(delta)
	if in_game:
		%BodyDirection.rotation = angle + PI * .5
