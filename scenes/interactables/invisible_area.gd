class_name InvisibleArea
extends Area3D

var count_overlaps: int = 0


func _physics_process(delta: float) -> void:

	#if visible:
	if count_overlaps > 0:
		show()
	else:
		hide()
	
	await get_tree().physics_frame
	count_overlaps = 0
