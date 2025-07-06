extends Control

@onready var fullscreen_check: CheckBox = $VBoxContainer/FullscreenCheck
@onready var borderless_check: CheckBox = $VBoxContainer/BorderlessCheck
@onready var back_button: Button = $VBoxContainer/Back
@onready var sound_player: AudioStreamPlayer = $SoundPlayer

func _ready():
	fullscreen_check.text = "Pantalla completa"
	borderless_check.text = "Pantalla sin bordes"
	back_button.text = "Volver"

	# Cargar valores actuales
	fullscreen_check.button_pressed = DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN
	borderless_check.button_pressed = DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN

	# Conectar señales
	fullscreen_check.toggled.connect(_on_fullscreen_toggled)
	borderless_check.toggled.connect(_on_borderless_toggled)
	back_button.pressed.connect(_on_back_pressed)

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
	else:
		if not fullscreen_check.button_pressed:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_back_pressed() -> void:
	sound_player.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://scenes/MainMenu/menu_options.tscn")
