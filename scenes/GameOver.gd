extends CanvasLayer

func _ready() -> void:
	%NewGame.grab_focus()

func _process(delta: float) -> void:
	if %MainControl.modulate.a < 1:
		%MainControl.modulate.a += delta
		if %MainControl.modulate.a > 1:
			%MainControl.modulate.a = 1

func find_world():
	for node in  get_parent().get_children():
		if node.name == "World":
			return node
	return null

func _on_new_game_pressed() -> void:
	var world = find_world()
	if world:
		world.tree_exited.connect(build_new_world)
		world.queue_free()
	else:
		print("world was not freeed")
		build_new_world()

func build_new_world():
	var new_world = load("res://scenes/SelectorMenu.tscn").instantiate()
	get_parent().add_child(new_world)
	queue_free()

func _on_main_menu_pressed() -> void:
	var world = find_world()
	if world:
		world.tree_exited.connect(build_main_menu)
		world.queue_free()
	else:
		print("world was not freeed")
		build_main_menu()

func build_main_menu():
	var new_world = load("res://scenes/MainMenu.tscn").instantiate()
	get_parent().add_child(new_world)
	queue_free()
