extends Node

var scene_dictionary  = {
	"train" : "res://scenes/game/01_train.tscn",
	"alley" : "res://scenes/game/02_alley.tscn",
	"town" : "res://scenes/game/03_town.tscn",
}

signal change_scene_requested

var last_scene: String = ""

func _ready() -> void:
	change_scene_requested.connect(change_scene)
	
func change_scene(from_scene: String, to_scene: String) -> void:
	last_scene = from_scene
	var to_scene_path = scene_dictionary.get(to_scene)
	get_tree().change_scene_to_file(to_scene_path)
