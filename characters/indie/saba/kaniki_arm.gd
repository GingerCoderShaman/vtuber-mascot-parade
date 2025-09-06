extends Node2D

var last_attack = 0

var parent

func _ready() -> void:
	parent = get_parent().get_parent()

func attack(body: Node2D) -> void:
	if parent.haste_countdown == 0:
		parent.haste_countdown = parent.haste
		%AnimationPlayer.play('attack')
		body.take_damage(parent.damage, self)


