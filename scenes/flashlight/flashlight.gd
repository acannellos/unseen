extends SpotLight3D

@export var area_3d: Area3D
@export var tex_light_on: TextureRect
@export var tex_light_off: TextureRect

var camera: Camera3D
var ray_length: float = 10.0

func _ready() -> void:
	camera = get_viewport().get_camera_3d()
	set_all_lights()
	
	if not Global.flag_train_dialogue_01:
		Global.is_light_on = false
		set_all_lights()

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
	
	if overlapping_areas:
		Events.area_overlapped.emit()
	
		for overlapping_area in overlapping_areas:
			if Global.is_light_on and (overlapping_area is InvisibleArea or overlapping_area is InvisibleSign):
				overlapping_area.count_overlaps += 1

func _input(event: InputEvent) -> void:
	
	if Global.is_speaking:
		return
	
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		
		if Global.needs_first_click:
			Global.needs_first_click = false
			return
		
		Global.is_light_on = !Global.is_light_on
		set_all_lights()
		play_sound()
	
	if event is InputEventMouseMotion:		
		var from = camera.project_ray_origin(event.position)
		var to = from + camera.project_ray_normal(event.position) * ray_length
		
		if Global.player:
			to.y = Global.player.global_position.y
		else:
			to.y = 0.0
		
		look_at(to)

func set_all_lights() -> void:
	visible = Global.is_light_on
	tex_light_on.visible = Global.is_light_on
	tex_light_off.visible = !Global.is_light_on

func play_sound() -> void:
	if visible:
		Audio.play("sounds/light_switch_on.wav")
	else:
		Audio.play("sounds/light_switch_off.wav")
