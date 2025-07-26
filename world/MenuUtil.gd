class_name MenuUtil

const HiddenButtonTheme = preload("res://scenes/HiddenButtonTheme.tres")

static func generate_character_select_button(min_scale:Vector2, scene:PackedScene):
	var button:Button = Button.new()
	button.custom_minimum_size = min_scale
	button.theme = HiddenButtonTheme
	var entity = scene.instantiate()
	entity.position = min_scale/2
	entity.in_game = false
	button.add_child(entity)
	return button
