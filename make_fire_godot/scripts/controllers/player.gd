extends Node2D
class_name DrumPlayer

@onready var timer = $RotationTime
@onready var sprite = $AnimatedSprite2D

@onready var key # La tecla/instrumento correspondiente al jugador

var counter = false

func prepare() -> void:
	counter = !counter
	sprite.scale.x = abs(sprite.scale.x) * (-1 if counter else 1)

	sprite.animation = "mantener"
	sprite.play()

func hit() -> void:
	sprite.animation = "golpe"
	sprite.play()
	
	await sprite.animation_finished
	
	counter = !counter
	sprite.scale.x = abs(sprite.scale.x) * (-1 if counter else 1)
