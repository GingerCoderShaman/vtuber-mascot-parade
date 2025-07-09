class_name AngryTakodachi
extends Enemy

@export var healing = 1.2

@export
var rate = 10

func _process(delta: float) -> void:
	super._process(delta)
	var target = null
	for enemy in World.current.enemies.get_children():
		if enemy.health != enemy.current_health && (target == null || target.global_position.distance_to(global_position) < enemy.global_position.distance_to(global_position)):
			target = enemy
	if target == null:
		for player in World.current.player.get_children():
			if target == null ||  target.global_position.distance_to(global_position) > player.global_position.distance_to(global_position):
				target = player
	
	var desired_angle = self.get_angle_to(target.global_position)
	angle = rotate_toward(angle, desired_angle, angle_speed * delta)
	var direction_to = Vector2(cos(angle), sin(angle)) * delta * angled_velocity
	position += direction_to


func process_effect(body, delta):
	delta *= rate
	if (body is Character && body.take_damage(delta)) ||\
		(body is Enemy && body.heal(delta * healing)):
		take_damage(delta)
