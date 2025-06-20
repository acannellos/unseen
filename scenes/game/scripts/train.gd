extends Node3D

@export var player: Player
@export var exit_area: Area3D

@export var spawn_pos_alley: Marker3D

@export var self_dialogue_01: DialogueResource

func _ready() -> void:
	exit_area.connect("body_entered", _on_body_entered)
	if not Global.flag_train_dialogue_01:
		await get_tree().create_timer(1.0).timeout
		#DialogueManager.show_example_dialogue_balloon(self_dialogue_01, "start")
		Global.flag_train_dialogue_01 = true
	
	if Scenes.last_scene == "alley":
		player.global_position = spawn_pos_alley.global_position

func _on_body_entered(body) -> void:
	await get_tree().physics_frame
	Scenes.change_scene("train", "alley")
