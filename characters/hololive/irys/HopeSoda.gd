extends Character

@export var haste_change = 20

func get_role():
	return "Support (More Haste)"

func get_fandom():
	return "Irys (Hololive)"
	
func get_description():
	return "The favorite Soda of IryS, when this soda is consumed, it boosts haste by 20% of the entire cooldown timer"
	
func get_role_skill_name():
	return "Support:"

func get_role_skill_value():
	return str(haste_change) + "% haste Increase"

func get_character_nane():
	return "Hope Soda"

func do_action():
	%Hope.play("HopeExplode")
	for player in World.current.player.get_children():
		if player == self:
			continue
		player.haste_countdown -= player.haste * (haste_change/100.0)
		if player.haste_countdown < 0:
			player.haste_countdown = 0
