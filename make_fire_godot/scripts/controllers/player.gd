extends Node2D
class_name DrumPlayer

@onready var timer = $RotationTime
@onready var sprite = $AnimatedSprite2D

var counter = false

func prepare() -> void:
	counter = !counter
	sprite.scale.x = abs(sprite.scale.x) * (-1 if counter else 1)

	sprite.animation = "maintain"
	sprite.play()

func fail() -> void:
	sprite.animation = "fail"
	sprite.play()
	
	await sprite.animation_finished
	
	sprite.animation = "idle"
	sprite.play()
	
	counter = !counter
	sprite.scale.x = abs(sprite.scale.x) * (-1 if counter else 1)

func hit() -> void:
	sprite.animation = "hit"
	sprite.play()
	
	await sprite.animation_finished
	
	sprite.animation = "idle"
	sprite.play()
	
	counter = !counter
	sprite.scale.x = abs(sprite.scale.x) * (-1 if counter else 1)

func up() -> void:
	sprite.animation = "up"
	sprite.play()
	
	await sprite.animation_finished
	
	sprite.animation = "idle"
	sprite.play()
