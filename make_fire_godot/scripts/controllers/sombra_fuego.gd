extends Node2D

const MAX_SCALE = 1.0
const MIN_SCALE = 1.1
const INTERVAL = 0.01

@onready var sprite = $Sprite2D
@onready var timer = Timer.new()

var t: float = 0.0
var direction: int = 1

func _ready():
	add_child(timer)
	timer.wait_time = INTERVAL
	timer.one_shot = false
	timer.autostart = true
	timer.timeout.connect(_on_timer_timeout)
	timer.start()

func _on_timer_timeout():
	# Usamos una función seno para escalar en forma de onda entre MAX y MIN
	t += INTERVAL
	var wave = sin(t * TAU) * 0.5 + 0.5  # Normalizado entre 0 y 1
	var scale_value = lerp(MAX_SCALE, MIN_SCALE, wave)
	sprite.scale = Vector2(scale_value, scale_value)
