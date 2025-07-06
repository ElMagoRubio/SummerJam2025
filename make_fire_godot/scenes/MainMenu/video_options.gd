extends Control

@onready var fullscreen_check: Button = $Audio/FullScreen
@onready var borderless_check: Button = $Audio/Borderless
@onready var back_button: Button = $Audio/Back
@onready var sound_player: AudioStreamPlayer = $Audio/SoundPlayer

func _on_fullscreen_toggled(pressed: bool) -> void:
	sound_player.play()
	if pressed:
		borderless_check.button_pressed = false
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		if not borderless_check.button_pressed:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_borderless_toggled(pressed: bool) -> void:
	sound_player.play()
	if pressed:
		fullscreen_check.button_pressed = false
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	elif !pressed:
		if not fullscreen_check.button_pressed:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_back_pressed() -> void:
	sound_player.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://scenes/MainMenu/menu_options.tscn")
