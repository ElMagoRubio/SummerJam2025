extends Control

@onready var sound = $VBoxContainer/SoundPlayer

func _ready():
	pass
	# pause

func _on_reanudar_pressed() -> void:
	pass
	#unpause


func _on_video_pressed() -> void:
	print("Boton video")
	await get_tree().create_timer(0.2).timeout
	sound.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://scenes/MainMenu/video_options.tscn")


func _on_audio_pressed() -> void:
	print("Boton audio")
	await get_tree().create_timer(0.2).timeout
	sound.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://scenes/MainMenu/audio_options.tscn")


func _on_salir_pressed() -> void:
	sound.play()
	print("Boton salir")
	await get_tree().create_timer(0.2).timeout
	get_tree().quit()
