class_name InvisibleArea
extends Area3D

@export var body: InteractableBody
var count_overlaps: int = 0

func _physics_process(delta: float) -> void:
	
	if Global.flag_has_key:
		count_overlaps += 1

	#if visible:
	if count_overlaps > 0:
		show()
		if body:
			body.set_collision_layer_value(2, true)
	else:
		hide()
		if body:
			body.set_collision_layer_value(2, false)
	
	count_overlaps = 0
