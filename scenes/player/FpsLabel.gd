extends Label

const TIMER_LIMIT := 2.0
var timer := 0.0

func _process(delta) -> void:
	timer += delta
	if timer > TIMER_LIMIT:
		set_text("FPS: %d" % Engine.get_frames_per_second())
		timer = 0.0
	


		
