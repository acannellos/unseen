extends Node3D

@export var play_scene: PackedScene

@onready var camera: Camera3D = $pcam/camera
@onready var light: SpotLight3D = $SpotLight3D

@onready var light_label: Label = $CanvasLayer/light_label

var is_light_on: bool = false
var ray_length: float = 10.0

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		is_light_on = !is_light_on
		light.visible = is_light_on
		light_label.visible = !is_light_on
		print(is_light_on)
	
	if event is InputEventMouseMotion:		
		var from = camera.project_ray_origin(event.position)
		var to = from + camera.project_ray_normal(event.position) * ray_length
		#to.y = 5.0
		#
		#light.global_position = to
		
		to.y = 0.0
		light.look_at(to)
	
	if Input.is_action_just_pressed("play"):
		get_tree().change_scene_to_packed(play_scene)
