class_name MenuUtil

const HiddenButtonTheme = preload("res://scenes/menus/resources/HiddenButtonTheme.tres")

static func generate_character_select_button(min_scale:Vector2, scene:PackedScene, on_click, on_focus, on_blur):
	var button:Button = Button.new()
	button.custom_minimum_size = min_scale
	button.theme = HiddenButtonTheme
	var entity = scene.instantiate()
	if (on_click):
		button.connect('pressed', on_click)
	if (on_focus):
		button.connect('focus_entered', on_focus)
		button.connect('mouse_entered', on_focus)	
	if (on_blur):
		button.connect('focus_exited', on_blur)
		button.connect('mouse_exited', on_blur)
	entity.position = min_scale/2
	entity.scale = min_scale/45
	entity.in_game = false
	button.add_child(entity)
	return button
