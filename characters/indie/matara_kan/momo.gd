extends Character

@export var cooldown_to_defense = 1.0

var parent

func _ready() -> void:
	super._ready()
	parent = get_parent()
	if parent is PlayerHandler:
		parent.damage_guard.append(self)
		
func _exit_tree() -> void:
	if parent is PlayerHandler:
		parent.damage_guard.erase(self)

func get_role():
	return "Tank"

func get_fandom():
	return "Matara Kan"
	
func get_description():
	return "Momos inheret their cockroach cabilities from their mother Matara Kan. they also believe in defending friends form the worst of it also like their mother. and they have inhereted these abilities to defend the players. their cooldown acts as a secondary health bar, and they take damage first in the party when cooldown has remaining value"
	
func get_role_skill_name():
	return "Damage Deflect:"

func get_role_skill_value():
	return "With Cooldown"

func get_character_nane():
	return "Momo"

func do_action():
	haste_countdown = 0

func defend(amount:float=1, source = null):
	var defender_health = (haste - haste_countdown) * cooldown_to_defense
	var result = defender_health - amount
	
	haste_countdown = haste - max(0, result/cooldown_to_defense)
	
	if source is LivingEntity:
		source.take_damage(min(amount, defender_health), self)
	
	return -result
	
