extends Control

@export var color_rect: ColorRect

func wipe(direction: String = "up"):
	var viewport_size = get_viewport_rect().size
	var full_height = viewport_size.y

	color_rect.visible = true
	var tween = self.create_tween()
	
	var up_time: float = 0.1
	
	match direction:
		"up":
			color_rect.size.y = 0
			color_rect.position.y = full_height
			tween.tween_property(color_rect, "size:y", full_height, 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
			tween.tween_property(color_rect, "position:y", 0, 0.2).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
			tween.tween_interval(0.2)
			tween.tween_property(color_rect, "size:y", 0.0, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
			tween.tween_property(color_rect, "position:y", full_height, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		
		"down":
			color_rect.size.y = 0
			color_rect.position.y = 0
			tween.tween_property(color_rect, "size:y", full_height, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
			tween.tween_property(color_rect, "position:y", full_height, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
			tween.tween_interval(0.2)
			tween.tween_property(color_rect, "size:y", 0.0, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
			tween.tween_property(color_rect, "position:y", 0, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
