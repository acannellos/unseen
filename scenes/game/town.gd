extends Node3D

#@export var player: Player
#
#var ray_length: float = 10.0
#
#@onready var camera: Camera3D = player.camera
#
#func _input(event: InputEvent) -> void:
	#if event is InputEventMouseMotion:
		##print("Mouse Motion at: ", event.position)
		#var from = camera.project_ray_origin(event.position)
		#var to = from + camera.project_ray_normal(event.position) * ray_length
		#to.y = 0
		#player.light.look_at(to)
