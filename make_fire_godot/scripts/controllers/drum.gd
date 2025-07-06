extends Node2D

@export var key_index: int

const MAX_SCALE = 1.2
const MIN_SCALE = 1.0
const ANIM_DURATION = 0.025

@onready var sprite = $Sprite2D
@onready var button = $Button
@onready var tween = get_tree().create_tween()

func _ready():
	_load_sprite()
	button.pressed.connect(_on_button_pressed)

func _load_sprite():
	match key_index:
		0:
			sprite.texture = load(GlobalConstants.DRUM_SPRITE_Q)
		1:
			sprite.texture = load(GlobalConstants.DRUM_SPRITE_W)
		2:
			sprite.texture = load(GlobalConstants.DRUM_SPRITE_O)
		3:
			sprite.texture = load(GlobalConstants.DRUM_SPRITE_P)


func _on_button_pressed():
	if tween.is_running():
		tween.kill()

	tween = get_tree().create_tween()
	tween.tween_property(sprite, "scale", Vector2(MAX_SCALE, MAX_SCALE), ANIM_DURATION).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tween.tween_property(sprite, "scale", Vector2(MIN_SCALE, MIN_SCALE), ANIM_DURATION).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
