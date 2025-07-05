extends Control

@onready var sound_player := $VBoxContainer/SoundPlayer

#func _on_jugar_pressed() -> void:
#	sound_player.play()
#	await get_tree().create_timer(0.2).timeout
#	get_tree().change_scene_to_file()


func _on_opciones_pressed() -> void:
	sound_player.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://scenes/MainMenu/opctions.tscn")


func _on_salir_pressed() -> void:
	sound_player.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().quit()
