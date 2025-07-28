extends CanvasLayer

@export var selectable_characters:Array[PackedScene]

var selected_entities = []

@export var min_size = 1

@export var max_size = 5

func _ready():
	for index in selectable_characters.size():
		var character_button = MenuUtil.generate_character_select_button(Vector2(%CharacterSelection.size.y, %CharacterSelection.size.y), selectable_characters[index])
		character_button.connect('pressed', func(): self.add_character(index))
		%CharacterSelection.add_child(character_button)
	%CharacterSelection.get_child(0).grab_focus()
func add_character(index):
	if %SelectedCharacters.get_child_count() >= max_size:
		return
	selected_entities.append(index)
	var character_button = MenuUtil.generate_character_select_button(Vector2(%SelectedCharacters.size.x, %SelectedCharacters.size.x), selectable_characters[index])
	character_button.connect('pressed', func(): remove_character(character_button.get_index()))
	%SelectedCharacters.add_child(character_button)
	
func remove_character(index):
	selected_entities.remove_at(index)
	%SelectedCharacters.remove_child(%SelectedCharacters.get_child(index))
	%CharacterSelection.get_child(0).grab_focus()
	
func start_game():
	if %SelectedCharacters.get_child_count() > max_size ||\
		%SelectedCharacters.get_child_count() < min_size:
		return
	var new_world = load("res://world/testing_enviroment.tscn").instantiate()
	get_parent().add_child(new_world)
	for character_index in selected_entities:
		new_world.player.add_child(selectable_characters[character_index].instantiate())
	new_world.player.start_player()
	queue_free()
