extends Panel

var Health:
	get: return %TXTHealth.text
	set(value): %TXTHealth.text = value

var Energy:
	get: return %TXTEnergy.text
	set(value): %TXTEnergy.text = value
	
var Fandom:
	get: return %TXTFandom.text
	set(value): %TXTFandom.text = value
	
var Role:
	get: return %TXTRole.text
	set(value): %TXTRole.text = value
	
var Description:
	get: return %Description.text
	set(value): %Description.text = value
	
var Name:
	get: return %TXTName.text
	set(value): %TXTName.text = value
	
var RoleSkill:
	get: return %TXTRoleSkill.text
	set(value): %TXTRoleSkill.text = value
	
var RoleSkillLabel:
	get: return %LabelRoleSkill.text
	set(value): %LabelRoleSkill.text = value

func setCharacter(character: Character):
	Health = str(character.health)
	Energy = str(character.haste)
	Fandom = character.get_fandom()
	Role = character.get_role()
	Description = character.get_description()
	RoleSkill = character.get_role_skill_value()
	RoleSkillLabel = character.get_role_skill_name()
	Name = character.get_character_nane()
	character.queue_free()
