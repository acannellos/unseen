extends SpotLight3D

@export var area_3d: Area3D

var camera: Camera3D
var ray_length: float = 10.0

func _ready() -> void:
	camera = get_viewport().get_camera_3d()
	visible = Global.is_light_on

	area_3d.connect("area_entered", _on_area_entered)
	area_3d.connect("area_exited", _on_area_exited)

func _on_area_entered(_area) -> void:
	if Global.is_light_on:
		_area.show()
	#print(area)

func _on_area_exited(_area) -> void:
	_area.hide()
	#print(area)

func _physics_process(delta: float) -> void:
	var overlapping_areas = area_3d.get_overlapping_areas()
	for overlapping_area in overlapping_areas:
		if Global.is_light_on:
			overlapping_area.show()
		else:
			overlapping_area.hide()

func _input(event: InputEvent) -> void:
	
	if Global.is_speaking:
		return
	
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		Global.is_light_on = !Global.is_light_on
		visible = Global.is_light_on
	
	if event is InputEventMouseMotion:		
		var from = camera.project_ray_origin(event.position)
		var to = from + camera.project_ray_normal(event.position) * ray_length
		
		if Global.player:
			to.y = Global.player.global_position.y
		else:
			to.y = 0.0
		
		look_at(to)
