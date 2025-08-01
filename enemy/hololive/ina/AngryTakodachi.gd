class_name AngryTakodachi
extends Enemy

@export var healing = 1.0

@export
var rate = 10

func _process(delta: float) -> void:
	super._process(delta)
	var target = null
	for enemy in World.current.enemies.get_children():
		if  enemy.current_health/enemy.health < .8  && enemy is not AngryTakodachi && \
			(target == null || target.position.distance_to(position) < enemy.position.distance_to(position)):
			target = enemy

	for item in World.current.enemies.get_children():
		if (item is Heal && target is not Heal && (current_health/health) < .5) && \
			item.health != item.current_health && (target == null || \
			item.position.distance_to(position) < item.position.distance_to(position)):
			target = item

	if target == null:
		for player in World.current.player.get_children():
			if target == null ||  target.position.distance_to(position) > \
				player.position.distance_to(position):
				target = player
	if target == null:
		return

	var desired_angle = self.get_angle_to(target.position)
	move_to_angle(desired_angle, delta)


func process_effect(body, delta):
	delta *= rate
	if body is Heal:
		body.heal_body(self)
		return
	
	if (body is Character && body.take_damage(delta)) ||\
		(body is Enemy && body.heal(delta * healing)):
		take_damage(delta * healing)
