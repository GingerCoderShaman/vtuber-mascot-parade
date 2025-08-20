class_name Character
extends LivingEntity

const HIT_BOX_LAYER = 2

var energy_bar

@export var haste: float = 1.5

@onready var haste_countdown = haste

func _ready() -> void:
	super._ready()
	energy_bar = load("res://characters/generic/units/Energybar.tscn").instantiate()
	add_child(load("res://characters/generic/units/Healthbar.tscn").instantiate())
	add_child(energy_bar)
	if in_game:
		energy_bar.max_energy = haste

func _process(delta: float) -> void:
	super._process(delta)
	if in_game:
		process_actions(delta)
		process_movement(delta)
		set_energy_bar(delta)

func set_energy_bar(_delta: float):
	energy_bar.energy = haste-haste_countdown

func _physics_process(delta):
	if in_game:
		process_movement(delta)

func process_movement(delta):
	var velocity_change = angled_velocity
	var index = get_index()
	var brothers = get_parent().get_children()
	var superior = null
	if index != 0:
		superior = brothers[index-1]
	if superior:
		var distance = position.distance_to(superior.position)
		var space_consumed = size + superior.size
		if distance > space_consumed:
			angle = position.angle_to_point(superior.position)
			velocity_change *= min(1, max(0, (distance/(space_consumed*2))))
			var direction_to = Vector2(cos(angle), sin(angle)) * delta * velocity_change
			position += direction_to
	else:
		var desired_direction = Vector2(
				Input.get_axis('world_left', 'world_right'),
				Input.get_axis('world_up', 'world_down'),
			)
		if(!desired_direction.is_zero_approx()):
			var desired_angle = atan2(desired_direction.y, desired_direction.x)
			angle = rotate_toward(angle, desired_angle, angle_speed * delta)

		var direction_to = Vector2(cos(angle), sin(angle)) * delta * velocity_change * global_scale 
		#IGNORE COLLISION PHYSICS
		if move_and_collide(Vector2.ZERO, true):
			position += direction_to
			return

		var collision_info = move_and_collide(direction_to)
		if collision_info:
			var change = direction_to.bounce(collision_info.get_normal())
			angle = atan2(change.y, change.x)

func process_actions(delta:float):
	haste_countdown -= delta
	if(haste_countdown < 0):
		haste_countdown = haste
		do_action()

func do_action():
	pass
