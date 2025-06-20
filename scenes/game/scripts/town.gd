extends Node3D

@export var exit_area: Area3D

func _ready() -> void:
	exit_area.connect("body_entered", _on_body_entered)

func _on_body_entered(body) -> void:
	await get_tree().physics_frame
	Scenes.change_scene("alley")
