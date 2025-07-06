extends RefCounted
class_name Track

var _level: int
var _instrument: int
var _bpm: int
var _tolerance: float
var _modifier: int
var _notes: Array[Note]

func _to_string() -> String:
	return """======= TRACK: =======
[LEVEL] %d
[INSTRUMENT] %d
[BPM] %d
[TOLERANCE] %f
[MODIFIER] %d
[NOTES]
- [AMMOUNT] %d
- [LIST]
=====================
""" % [_level, _instrument, _bpm, _tolerance, _modifier, _notes.size()]
