class_name MascotSnakePart
extends Node2D

var angle_speed = 3

var angle = 0

@export
var superior:MascotSnakePart

@export
var velocity = 150

@export
var current_health:int = 0

@export
var character:Character

func _ready() -> void:
	if character == null:
		character = load("res://characters/dragoons/RegularDragoon.tscn").instantiate()
		print("body not found, using default template")
	current_health = character.health
	add_child(character)
	
	if superior:
		velocity = superior.velocity

func _process(delta: float) -> void:
	var velocity_change = velocity
	if superior:
		var distance = position.distance_to(superior.position)
		var space_consumed = character.size + superior.character.size
		if distance > space_consumed:
			angle = position.angle_to_point(superior.position)
			
			velocity_change *= min(1, max(0, (distance/(space_consumed*2)))) 
	else:
		var desired_direction = Vector2(
				Input.get_axis('world_left', 'world_right'),
				Input.get_axis('world_up', 'world_down'),
			)
		if(!desired_direction.is_zero_approx()):
			var desired_angle = atan2(desired_direction.y, desired_direction.x)
			angle = rotate_toward(angle, desired_angle, angle_speed * delta)
	
	var direction_to = Vector2(cos(angle), sin(angle)) * delta * velocity_change
	position += direction_to
		
		
		
