extends Node2D

@onready var timer = $RotationTime
@onready var sprite = $Sprite2D

@onready var counter = false

func _ready():
	timer.wait_time = 0.2 #Modificar para seguir ritmo musica
	timer.start()
	timer.timeout.connect(_on_rotation_time_timeout)

func _on_rotation_time_timeout() -> void:
	counter = !counter
	if counter == false:
		sprite.rotation += deg_to_rad(30)
	else:
		sprite.rotation -= deg_to_rad(30)
