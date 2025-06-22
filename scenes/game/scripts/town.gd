extends Node3D

@export var exit_area: Area3D
@export var door_body: InteractableBody

func _ready() -> void:
	exit_area.connect("body_entered", _on_body_entered)
	Global.flag_has_been_to_town = true
	door_body.interacted.connect(_on_interacted)

func _on_body_entered(body) -> void:
	Scenes.scene_xfer.wipe("down")
	await get_tree().create_timer(0.5).timeout
	Scenes.change_scene("town", "alley")

func _on_interacted() -> void:
	Global.flag_has_tried_door = true
