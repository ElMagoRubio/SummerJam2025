extends Node2D

var motion_locked: bool = true
var spacebar_pressed: bool
var player_map: Array[DrumPlayer] = []

@onready var player_0:DrumPlayer = $Player1
@onready var player_1:DrumPlayer = $Player4
@onready var player_2:DrumPlayer = $Player3
@onready var player_3:DrumPlayer = $Player2


func _ready():
	player_map.append_array([player_0, player_1, player_2, player_3])
	

func _input(event: InputEvent) -> void:
	
	var player_index: int = -1
	if event.is_action_pressed("KEY_INPUT_0"):
		player_index = 0
	if event.is_action_pressed("KEY_INPUT_1"):
		player_index = 1
	if event.is_action_pressed("KEY_INPUT_2"):
		player_index = 2
	if event.is_action_pressed("KEY_INPUT_3"):
		player_index = 3
	if event.is_action_pressed("SPACEBAR"):
		player_index = 4
	if event.is_action_pressed("ESCAPE"):
		pass
	if event.is_action_pressed("ENTER"):
		pass
	
	if player_index != -1:
		_play_player_animation(player_index)

func _play_player_animation(player_index: int):
	var player:DrumPlayer
	match player_index:
		0:
			player = player_0
		1:
			player = player_1
		2:
			player = player_2
		3:
			player = player_3
	player.hit()

func _prepare_player_for_hit(player_index: int):
	match player_index:
		0:
			player_0.prepare()
		1:
			player_1.prepare()
		2:
			player_2.prepare()
		3:
			player_3.prepare()


func _on_beat_starting(instrument: int, note: Note) -> void:
	print("BEAT STARTING", instrument)

func _on_beat_instant(instrument: int, note: Note) -> void:
	print("BEAT INSTANT", instrument)

func _on_beat_ending(instrument: int, note: Note) -> void:
	print("BEAT ENDING", instrument)
	player_map[instrument].fail()
