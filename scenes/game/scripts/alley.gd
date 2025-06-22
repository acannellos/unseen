extends Node3D

#@export var player: Player

@export var spawn_pos_train: Marker3D
@export var spawn_pos_town: Marker3D

@export var enter_area: Area3D
@export var exit_area: Area3D

func _ready() -> void:
	enter_area.connect("body_entered", _on_body_entered_entrance)
	exit_area.connect("body_entered", _on_body_entered_exit)
	
	if Scenes.last_scene == "train station":
		Global.player.global_position = spawn_pos_train.global_position
	
	if Scenes.last_scene == "town":
		Global.player.global_position = spawn_pos_town.global_position

func _on_body_entered_entrance(body) -> void:
	Scenes.scene_xfer.wipe("down")
	await get_tree().create_timer(0.5).timeout
	Scenes.change_scene("alley", "train station")

func _on_body_entered_exit(body) -> void:
	await get_tree().physics_frame
	Scenes.scene_xfer.wipe("up")
	await get_tree().create_timer(0.6).timeout
	Scenes.change_scene("alley", "town")
