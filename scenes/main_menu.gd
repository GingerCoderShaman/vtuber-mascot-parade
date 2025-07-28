extends CanvasLayer

func _ready() -> void:
	%NewGame.grab_focus()

func _on_new_game_pressed() -> void:
	var new_world = load("res://scenes/SelectorMenu.tscn").instantiate()
	get_parent().add_child(new_world)
	queue_free()


func _on_exit_pressed() -> void:
	get_tree().quit()
