class_name World
extends Node

static var current

@onready var enemies = %Enemies
@onready var objects = %Objects
@onready var player = $Player

func _enter_tree() -> void:
	if current != null:
		print("dup world issue!!!")
		return
	current = self

func _exit_tree() -> void:
	current = null
