extends Node
class_name TrackManager

var track_deserializer: TrackDeserializer = TrackDeserializer.new()

var _actual_level: int
var _actual_modifier: int

var _tracks: Array[Track] = []
var _responders: Array[TrackResponder] = []
var _validators: Array[TrackValidator] = []
var _threads: Array[Thread] = []
var _thread_data: Dictionary = {}

func init_level(level: int, modifier: int) -> void:
	_actual_level = level
	_actual_modifier = modifier
	_load_level_tracks()
	print("INFO: Level %d with modifier %d loaded" % [level, modifier])

func _load_level_tracks() -> void:
	for i in range(0, GlobalConstants.MAX_PLAYERS):
		var track = track_deserializer.load_track_from_json(_actual_level, i, _actual_modifier)
		if track != null:
			_tracks.append(track)
			print("Track %d loaded" % i)

func start_track_execution() -> void:
	for i in _tracks.size():
		var track = _tracks[i]
		var validator = TrackValidator.new()
		var responder:TrackResponder = TrackResponder.new()
		add_child(validator)
		add_child(responder)

		validator.instrument = track._instrument
		responder.instrument = track._instrument
		
		_responders.append(responder)
		_validators.append(validator)
		emit_signal("track_responder_registered", responder)
		 
		var thread := Thread.new()
		_threads.append(thread)

		# Llamamos al método y pasamos argumentos usando bind
		var callable := Callable(self, "_thread_process_track").bind(track, responder, validator)
		thread.start(callable)


func _thread_process_track(track: Track, responder: TrackResponder, validator: TrackValidator) -> void:
	for note: Note in track._notes:
		print("INFO in TrackManager._thread_process_track: Awating for note pressed in instrument %s" % track._instrument)
		var wait_time := note._start_time - Time.get_ticks_msec() / 1000.0
		if wait_time > 0:
			await get_tree().create_timer(wait_time).timeout

		responder.emit_beat_events(note, validator)

		var success = validator.check_input(track, note)
		if success:
			call_deferred("_register_hit", track, note)
		else:
			call_deferred("_register_miss", track, note)


func _register_hit(track: Track, note: Note) -> void:
	print("✔ HIT on instrument %d at %.2f" % [track._instrument, note._original_time])

func _register_miss(track: Track, note: Note) -> void:
	print("✘ MISS on instrument %d at %.2f" % [track._instrument, note._original_time])

func _exit_tree() -> void:
	for thread in _threads:
		if thread.is_alive():
			thread.wait_to_finish()
