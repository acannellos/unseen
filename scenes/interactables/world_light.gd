class_name WorldLight
extends SpotLight3D

@export var area_3d: Area3D

func _ready() -> void:
	area_3d.connect("area_entered", _on_area_entered)
	area_3d.connect("area_exited", _on_area_exited)

func _on_area_entered(_area) -> void:
	if visible:
		_area.show()

func _on_area_exited(_area) -> void:
	_area.hide()

func _physics_process(delta: float) -> void:
	var overlapping_areas = area_3d.get_overlapping_areas()
	
	for overlapping_area in overlapping_areas:
		if visible and (overlapping_area is InvisibleArea or overlapping_area is InvisibleSign):
			overlapping_area.count_overlaps += 1
