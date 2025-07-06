extends Control

@onready var back_sound := $VBoxContainer/Back/SoundPlayer

func _on_back_pressed() -> void:
	back_sound.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://scenes/MainMenu/menu_options.tscn")
