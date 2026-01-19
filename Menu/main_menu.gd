extends Control

@export var game_map : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/QuitGameButton.pressed.connect(_on_quit_button_pressed)
	$VBoxContainer/NewGameButton.pressed.connect(_on_new_game_burron_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_quit_button_pressed():
	get_tree().quit()

func _on_new_game_burron_pressed():
	get_tree().change_scene_to_packed(game_map)
