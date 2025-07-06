extends Node
class_name TrackResponder

var instrument: int

signal beat_starting(note: Note)
signal beat_instant(note: Note)
signal beat_ending(note: Note)

func emit_beat_events(note: Note) -> void:
	if get_tree() == null:
		await ready  # Espera a que esté en el árbol

	emit_signal("beat_starting", instrument, note)
	await get_tree().create_timer(note._start_time - note._original_time).timeout
	emit_signal("beat_instant", instrument, note)
	await get_tree().create_timer(note._end_time - note._start_time).timeout
	emit_signal("beat_ending", instrument, note)
