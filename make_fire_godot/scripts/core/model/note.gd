extends RefCounted
class_name Note

var _original_time: float
var _start_time: float
var _end_time: float

func _to_string() -> String:
	return """======= NOTE: =======
[ORIGINAL_TIME] %f 
[START_TIME] %f 
[END_TIME] %f
=====================
""" % [_original_time, _start_time, _end_time]
