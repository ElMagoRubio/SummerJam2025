extends Node2D

var motion_locked: bool = true

var track_manager: TrackManager

@onready var player_0:DrumPlayer = $Player1
@onready var player_1:DrumPlayer = $Player2
@onready var player_2:DrumPlayer = $Player3
@onready var player_3:DrumPlayer = $Player4

var spacebar_pressed: bool
var escape_pressed: bool
var enter_pressed: bool

func _process(delta: float) -> void:
	escape_pressed = Input.is_action_pressed("ESCAPE")
	if motion_locked:
		return
	track_manager._validators[0].input_pressed = Input.is_action_pressed("KEY_INPUT_0")
	track_manager._validators[1].input_pressed = Input.is_action_pressed("KEY_INPUT_1")
	track_manager._validators[2].input_pressed = Input.is_action_pressed("KEY_INPUT_2")
	track_manager._validators[3].input_pressed = Input.is_action_pressed("KEY_INPUT_3")
	spacebar_pressed = Input.is_action_pressed("SPACEBAR")
	enter_pressed = Input.is_action_pressed("ENTER")

func _ready():
	track_manager = TrackManager.new()
	track_manager.init_level(GlobalConstants.DEMO_LEVEL, GlobalConstants.DEMO_MODIFIER)
	await track_manager.start_track_execution()
	_init_responder_events(track_manager._responders)

func _input(event: InputEvent) -> void:
	for validator in track_manager._validators:
		validator.forward_input(event)


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

func _player_hit(player_index: int):
	match player_index:
		0:
			player_0.hit()
		1:
			player_1.hit()
		2:
			player_2.hit()
		3:
			player_3.hit()

func _init_responder_events(responders: Array[TrackResponder]):
	for responder: TrackResponder in responders:
		responder.beat_starting.connect(_on_beat_starting)
		responder.beat_instant.connect(_on_beat_instant)
		responder.beat_ending.connect(_on_beat_ending)

func _on_beat_starting(instrument: int, note: Note) -> void:
	print("🎵 BEAT STARTING", instrument, note)

func _on_beat_instant(instrument: int, note: Note) -> void:
	print("🎯 BEAT INSTANT", instrument)

func _on_beat_ending(instrument: int, note: Note) -> void:
	print("⏹️ BEAT ENDING", instrument)
