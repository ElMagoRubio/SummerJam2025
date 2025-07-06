extends Node
class_name DemoController

const ANTICIPATION_TIME := 0.1  # segundos antes del beat

var anticipation_fired :bool = false 

@onready var player_0:DrumPlayer = $Player0
@onready var player_1:DrumPlayer = $Player3
@onready var player_2:DrumPlayer = $Player2
@onready var player_3:DrumPlayer = $Player1
var players: Array[DrumPlayer] = []
@onready var bg_music = $BGMusic

@onready var drum_0 = $Tambor0
@onready var drum_1 = $Tambor1
@onready var drum_2 = $Tambor2
@onready var drum_3 = $Tambor3
var drums:Array[AudioStreamPlayer] = []

const BEAT_INTERVAL := 0.5
const BEAT_TOLERANCE := 0.15

var time_passed := 0.0
var next_beat_time := 0.0
var beat_number := 0
var input_buffer := [] 

@onready var totem_2 = $Totem2
@onready var totem_1 = $Totem1
@onready var totem_2_button = $Totem2/Button
@onready var totem_1_button = $Totem1/Button

func _ready():
	players.append_array([player_0, player_1, player_2, player_3])
	drums.append_array([drum_0, drum_1, drum_2, drum_3])
	print("Metrónomo iniciado")


func _process(delta):
	time_passed += delta

	# Acción previa al beat
	if not anticipation_fired and time_passed >= next_beat_time - ANTICIPATION_TIME:
		anticipation_fired = true
		print("🔶 ANTICIPACIÓN DEL BEAT")
		# Aquí haz lo que quieras antes del beat, por ejemplo:
		for p in players:
			p.up()  # o flash, efecto visual, etc.

	# Acción en el beat
	if time_passed >= next_beat_time:
		print("BEAT:", beat_number)
		_process_inputs()
		next_beat_time += BEAT_INTERVAL
		anticipation_fired = false
		beat_number += 1


func _process_inputs():
	for input_time in input_buffer:
		var distance = abs(input_time - next_beat_time)
		if distance <= BEAT_TOLERANCE:
			print("✅ ¡Acierto!")
		else:
			print("❌ Fallo (fuera de tiempo)")
	input_buffer.clear()

func _input(event: InputEvent) -> void:
	
	if event.is_pressed():
		if event.is_action("KEY_INPUT_0") or event.is_action("KEY_INPUT_1") or event.is_action("KEY_INPUT_2") or event.is_action("KEY_INPUT_3"):
			var input_time = time_passed
			input_buffer.append(input_time)
	
	var player_index: int = -1
	if event.is_action_pressed("KEY_INPUT_0"):
		player_index = 0
	if event.is_action_pressed("KEY_INPUT_1"):
		player_index = 1
	if event.is_action_pressed("KEY_INPUT_2"):
		player_index = 2
	if event.is_action_pressed("KEY_INPUT_3"):
		player_index = 3
	if event.is_action_pressed("ESCAPE"):
		pass
	if event.is_action_pressed("ENTER"):
		pass
	
	if player_index <= -1:
		return
	var player = players[player_index]
	player.hit()
	await (player.sprite as AnimatedSprite2D).animation_finished
	drums[player_index].play()
	increase_totem(player_index)

func increase_totem(player_index: int):
	if player_index >= 0 and player_index <= 1:
		totem_1_button.emit_signal("pressed")
	elif player_index >= 2 and player_index <= 3:
		totem_2_button.emit_signal("pressed")
