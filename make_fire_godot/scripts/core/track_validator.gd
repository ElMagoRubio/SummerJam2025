extends Node
class_name TrackValidator

var last_input_time: float = -1.0
var instrument: int

func forward_input(event: InputEvent) -> void:
	if event.is_action_pressed("KEY_INPUT_%d" % instrument):
		print("INFO in TrackValidator.forward_input: Key pressed in validator nº %" % [instrument])
		last_input_time = Time.get_ticks_msec() / 1000.0


func check_input(track: Track, note: Note) -> bool:
	var input_time = _get_input_time_for_instrument(track._instrument)
	return note._start_time <= input_time and input_time <= note._end_time

func _get_input_time_for_instrument(_instrument: int) -> float:
	return last_input_time
