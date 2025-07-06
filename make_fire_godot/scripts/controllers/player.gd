extends Node2D

@onready var timer = $RotationTime
@onready var sprite = $AnimatedSprite2D

@onready var key # La tecla/instrumento correspondiente al jugador

var counter = false

func _process(delta):
	sprite.play()
	await sprite.animation_finished
	rotate_sprite()

func _on_play_note_button_down() -> void:
	sprite.animation = "maintain"
	sprite.play()
	await sprite.animation_finished
	rotate_sprite()

func _on_play_note_button_up() -> void:
	sprite.animation = "hit"
	sprite.play()
	
	await sprite.animation_finished
	
	sprite.animation = "idle"
	rotate_sprite()

func rotate_sprite():
	counter = !counter
	sprite.scale.x = abs(sprite.scale.x) * (-1 if counter else 1)
