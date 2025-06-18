extends Node3D

@export var exit_area: Area3D

@export var town_scene: PackedScene

func _ready() -> void:
	exit_area.connect("body_entered", _on_body_entered)

func _on_body_entered(body) -> void:
	await get_tree().physics_frame
	get_tree().change_scene_to_packed(town_scene)
