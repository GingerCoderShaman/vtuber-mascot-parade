class_name AngryDragoon
extends Enemy

@export
var damage = 2

@export
var haste:float = 10

var haste_countdown
var laser = preload('res://objects/EnemyLaser.tscn')

func _ready() -> void:
	super._ready()
	haste_countdown = haste

func _process(delta: float) -> void:
	super._process(delta)
	if World.current.player.get_children().size() == 0:
		return
	var tail = World.current.player.get_child(0)
	var desired_angle = self.get_angle_to(tail.global_position)
	move_to_angle(desired_angle + PI, delta)

	haste_countdown -= delta
	if(haste_countdown < 0):
		haste_countdown = haste
		var laser = self.laser.instantiate()
		laser.rotation = position.angle_to_point(tail.position)
		laser.position = position
		World.current.objects.add_child(laser)
	
