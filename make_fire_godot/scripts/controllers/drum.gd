extends Node2D

const MAX_SCALE = 1.2
const MIN_SCALE = 1.0
const ANIM_DURATION = 0.025  # Tiempo de subida y bajada (total: 0.05s)

@onready var sprite = $Sprite2D
@onready var button = $Button
@onready var tween = get_tree().create_tween()

func _ready():
	button.pressed.connect(_on_button_pressed)

func _on_button_pressed():
	# Reinicia el tween si ya se está ejecutando
	if tween.is_running():
		tween.kill()

	tween = get_tree().create_tween()
	tween.tween_property(sprite, "scale", Vector2(MAX_SCALE, MAX_SCALE), ANIM_DURATION).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_property(sprite, "scale", Vector2(MIN_SCALE, MIN_SCALE), ANIM_DURATION).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
