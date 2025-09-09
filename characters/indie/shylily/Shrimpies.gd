class_name Shrimpies
extends Character

@export var protective_barrier_amount = 5.0
@export var protective_barrier_decay_rate = 1.0

var bubble_scene = preload("res://characters/indie/shylily/Bubble.tscn")
	
func get_role():
	return "Protector"

func get_fandom():
	return "Shylily"
	
func get_description():
	return "Shylilys loyal fans like to protect other innocent fandoms, and will creatre bubbles to defend them."
	
func get_role_skill_name():
	return "Barrier:"

func get_role_skill_value():
	return str(protective_barrier_amount)

func get_character_nane():
	return "Shrimpies"

func do_action():
	var children = World.current.player.get_children()
	var choosen = children.pick_random()
	var bubble = bubble_scene.instantiate()
	bubble.protection = protective_barrier_amount
	bubble.decay_rate = protective_barrier_decay_rate
	
	choosen.add_child(bubble)
