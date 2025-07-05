class_name Character
extends CharacterBody2D

const HIT_BOX_LAYER = 2

@export var health: int = 5
@export var size: float = 6
@export var haste: float = 1.5

@onready var haste_countdown = haste

@export var hit_box: Area2D


func _process(delta: float) -> void:
	haste_countdown -= delta
	if(haste_countdown < 0):
		do_action()
		haste_countdown = haste
		
func do_action():
	pass

func get_controller():
	return get_parent()
