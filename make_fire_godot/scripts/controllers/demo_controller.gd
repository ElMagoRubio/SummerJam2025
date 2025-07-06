extends Node
class_name DemoController

@onready var player_0:DrumPlayer = $Player1
@onready var player_1:DrumPlayer = $Player4
@onready var player_2:DrumPlayer = $Player3
@onready var player_3:DrumPlayer = $Player2
var players: Array[DrumPlayer] = []


const BEAT_INTERVAL := 0.5            # segundos entre beats
const BEAT_TOLERANCE := 0.15          # margen de acierto

var time_passed := 0.0
var next_beat_time := 0.0
var beat_number := 0
var input_buffer := []  # Guarda inputs temporales para procesar en el frame correcto

func _ready():
	players.append_array([player_0, player_1, player_2, player_3])
	print("Metrónomo iniciado")

func _process(delta):
	time_passed += delta

	if time_passed >= next_beat_time:
		print("BEAT:", beat_number)
		_process_inputs()
		next_beat_time += BEAT_INTERVAL
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
	
	players[player_index].hit()
	
	if player_index >= 0 and player_index <= 1:
		pass
	elif player_index >= 2 and player_index <= 3:
		pass
