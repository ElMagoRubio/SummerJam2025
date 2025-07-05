extends Node

func _ready() -> void:
	print("Launching dictator_test...")
	dictator_test()

func dictator_test():
	var dictator = DictatorTest.new()
	var track: Track = dictator.load_track_from_json(1, 0, 1)
	print(track)
	for note in track._notes:
		print(note)
