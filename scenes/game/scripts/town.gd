extends Node3D

@export var exit_area: Area3D

func _ready() -> void:
	exit_area.connect("body_entered", _on_body_entered)

func _on_body_entered(body) -> void:
	Scenes.scene_xfer.wipe("down")
	await get_tree().create_timer(0.5).timeout
	Scenes.change_scene("town", "alley")
