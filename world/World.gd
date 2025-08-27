class_name World
extends Node2D

static var current

@export
var world_size = Vector2(500, 500)

var game_over = false

@onready var enemies = %Enemies
@onready var objects = %Objects
@onready var player = $Player

func _ready() -> void:
	pass
	#get_viewport().size_changed.connect(fit_screen)
	#fit_screen()
	
func _process(delta: float) -> void:
	if !game_over:
		check_game_over()
	else:
		check_delete_game(delta)

func fit_screen():
	var viewport_size = get_viewport().size
	var viewport_scale = Vector2(viewport_size.x, viewport_size.y)/world_size
	if viewport_scale.x < viewport_scale.y:
		viewport_scale.y = viewport_scale.x
	else:
		viewport_scale.x = viewport_scale.y
	scale = viewport_scale
	
func _enter_tree() -> void:
	if current != null:
		print("dup world issue!!!")
		return
	current = self

func _exit_tree() -> void:
	current = null

	
func check_game_over():
	if %Player.get_children().size() == 0:
		game_over = true
		get_parent().add_child(load("res://scenes/GameOver.tscn").instantiate())
		
func check_delete_game(delta):
	modulate.a -= delta/10
	if modulate.a < 0:
		queue_free()
