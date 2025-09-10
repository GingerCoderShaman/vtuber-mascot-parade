extends Label

var remaining_time = 0.0
var started_time = 0.0

func setup_warning(text, time):
	if remaining_time > 0:
		return
	started_time = time
	remaining_time = time
	set_text(text)
	
func _process(delta: float) -> void:
	remaining_time -= delta
	modulate.a = remaining_time/ started_time
	
