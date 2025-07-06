extends Node
class_name TrackManager

var track_deserializer: TrackDeserializer = TrackDeserializer.new()

var track_instrument_0: Track
var track_instrument_1: Track
var track_instrument_2: Track
var track_instrument_3: Track

var _actual_level: int
var _actual_modifier: int

func init_level(level: int, modifier: int):
	_actual_level = level
	_actual_modifier = modifier
	_load_level_tracks()
	print("INFO in TrackManager.init_level: Level loaded")

func _load_level_tracks() -> void:
		track_instrument_0 = _load_track(_actual_level, 0, _actual_modifier)
		print("INFO in TrackManager._load_level_tracks: Track 0 loaded")
		track_instrument_1 = _load_track(_actual_level, 1, _actual_modifier)
		print("INFO in TrackManager._load_level_tracks: Track 1 loaded")
		track_instrument_2 = _load_track(_actual_level, 2, _actual_modifier)
		print("INFO in TrackManager._load_level_tracks: Track 2 loaded")
		track_instrument_3 = _load_track(_actual_level, 3, _actual_modifier)
		print("INFO in TrackManager._load_level_tracks: Track 3 loaded")

func _load_track(level: int, instrument: int, modifier: int) -> Track:
	return track_deserializer.load_track_from_json(level, instrument, modifier)

func get_tracks() -> Array[Track]:
	return [track_instrument_0, track_instrument_1, track_instrument_2, track_instrument_3]
