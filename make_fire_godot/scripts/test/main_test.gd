extends Node

func _ready() -> void:
	# track_deserializer_test()
	track_manager_test(false)

func track_deserializer_test():
	print("INFO in MainTest.track_deserializer_test: Launching track_deserializer_test...")
	
	var track_deserializer = TrackDeserializer.new()
	var track: Track = track_deserializer.load_track_from_json(1, 0, 1)
	
	print(track)
	for note in track._notes:
		print(note)

func track_manager_test(show_notes: bool):
	print("INFO in MainTest.track_manager_test: Launching track_manager_test...")
	
	var track_manager: TrackManager = TrackManager.new()
	track_manager.init_level(1, 1)
	
	for track in track_manager.get_tracks():
		print(track)
		if show_notes:
			for note in track._notes:
				print(note)
	
