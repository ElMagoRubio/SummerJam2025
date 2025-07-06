extends Node
class_name TrackValidator

func check_input(note: Note) -> bool:
	var input_time = _get_input_time_for_instrument(note._instrument)

	# Verifica si se ha pulsado entre el rango permitido
	return note._start_time <= input_time and input_time <= note._end_time

func _get_input_time_for_instrument(instrument: int) -> float:
	# Aquí deberías consultar si el jugador pulsó ese instrumento,
	# por ejemplo con un input registrado global o desde el WorldManager
	# Placeholder ficticio:
	return Time.get_ticks_msec() / 1000.0
