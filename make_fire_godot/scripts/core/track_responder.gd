extends Node
class_name TrackResponder

var instrument: int

signal beat_starting(note: Note)
signal beat_instant(note: Note)
signal beat_ending(note: Note)

func emit_beat_events(note: Note, validator: TrackValidator) -> void:
	if get_tree() == null:
		await self.ready  # ✅ Espera a estar en el árbol de nodos

	await get_tree().process_frame  # ⚠️ Garantiza al menos 1 frame de estabilidad

	emit_signal("beat_starting", instrument, note)
	await get_tree().create_timer(note._start_time - note._original_time).timeout
	emit_signal("beat_instant", instrument, note)
	await get_tree().create_timer(note._end_time - note._start_time).timeout

	if not validator.has_successful_hit():
		emit_signal("beat_ending", instrument, note)
