extends Node
class_name TrackResponder

signal beat_starting(instrument: int, note: Note)
signal beat_instant(instrument: int, note: Note)
signal beat_ending(instrument: int, note: Note)

func emit_beat_events(note: Note) -> void:
	emit_signal("beat_starting", note._instrument, note)
	await get_tree().create_timer(note._start_time - note._original_time).timeout
	emit_signal("beat_instant", note._instrument, note)
	await get_tree().create_timer(note._end_time - note._start_time).timeout
	emit_signal("beat_ending", note._instrument, note)
