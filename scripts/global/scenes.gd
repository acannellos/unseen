extends Node

var scene_dictionary  = {
	"train" : "res://scenes/game/01_train.tscn",
	"alley" : "res://scenes/game/02_alley.tscn",
	"town" : "res://scenes/game/03_town.tscn",
}

signal change_scene_requested

var current_scene: String = ""

func _ready() -> void:
	change_scene_requested.connect(change_scene)
	
func change_scene(scene_name: String) -> void:
	current_scene = get_tree().current_scene.scene_file_path
	scene_name = scene_dictionary.get(scene_name, scene_name)
	get_tree().change_scene_to_file(scene_name)
