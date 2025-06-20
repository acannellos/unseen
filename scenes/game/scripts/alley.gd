extends Node3D

@export var player: Player

@export var spawn_pos_train: Marker3D
@export var spawn_pos_town: Marker3D

@export var enter_area: Area3D
@export var exit_area: Area3D

func _ready() -> void:
	enter_area.connect("body_entered", _on_body_entered_entrance)
	exit_area.connect("body_entered", _on_body_entered_exit)
	
	if Scenes.last_scene == "train":
		player.global_position = spawn_pos_train.global_position
	
	if Scenes.last_scene == "town":
		player.global_position = spawn_pos_town.global_position

func _on_body_entered_entrance(body) -> void:
	await get_tree().physics_frame
	Scenes.change_scene("alley", "train")

func _on_body_entered_exit(body) -> void:
	await get_tree().physics_frame
	Scenes.change_scene("alley", "town")
