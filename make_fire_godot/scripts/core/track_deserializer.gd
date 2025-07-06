extends RefCounted
class_name TrackDeserializer

func load_track_from_json(level: int, instrument: int, modifier: int) -> Track:
	
	var json_path
	
	match instrument:
		0: json_path = GlobalConstants.LEVEL_1_INSTRUMENT_0_MOD_1_MIDIJSON_PATH
		1: json_path = GlobalConstants.LEVEL_1_INSTRUMENT_1_MOD_1_MIDIJSON_PATH
		2: json_path = GlobalConstants.LEVEL_1_INSTRUMENT_2_MOD_1_MIDIJSON_PATH
		3: json_path = GlobalConstants.LEVEL_1_INSTRUMENT_3_MOD_1_MIDIJSON_PATH
	
	var file = FileAccess.open(json_path, FileAccess.READ)
	var content = file.get_as_text()
	var data = JSON.parse_string(content)
	
	# Null check
	if data == null:
		push_error("Error in Dictator.load_track_from_json: Invalid track JSON")
		return null
	
	var track_dict = data[0]
	var track:Track = Track.new()
	track._level = int(track_dict["level"])
	track._instrument = int(track_dict["instrument"])
	track._bpm = int(track_dict["song_bpm"])
	track._tolerance = float(track_dict["tolerance_time"])
	track._modifier = int(track_dict["tolerance_modifier"])
	track._notes = []
	
	for note_dict in track_dict["notes"]:
		var note = Note.new()
		note._original_time = float(note_dict["original_time"])
		note._start_time = float(note_dict["start_time"])
		note._end_time = float(note_dict["end_time"])
		track._notes.append(note)
		
	return track
