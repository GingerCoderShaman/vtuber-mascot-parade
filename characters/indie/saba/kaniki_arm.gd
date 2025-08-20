extends Node2D

var last_attack = 0 

var haste = 0
var damage = 0

func _ready() -> void:
	haste = get_parent().get_parent().haste
	damage = get_parent().get_parent().damage

func attack(body: Node2D) -> void:
	var seconds = Time.get_unix_time_from_system()
	print(seconds)
	print(haste)
	print(last_attack)
	if seconds - haste > last_attack:
		print('attack made')
		%AnimationPlayer.play('attack')
		last_attack = seconds
		body.take_damage(damage)

		
