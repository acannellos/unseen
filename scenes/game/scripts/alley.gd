extends Node3D

@export var enter_area: Area3D
@export var exit_area: Area3D

func _ready() -> void:
	enter_area.connect("body_entered", _on_body_entered_entrance)
	exit_area.connect("body_entered", _on_body_entered_exit)

func _on_body_entered_entrance(body) -> void:
	await get_tree().physics_frame
	Scenes.change_scene("train")

func _on_body_entered_exit(body) -> void:
	await get_tree().physics_frame
	Scenes.change_scene("town")
