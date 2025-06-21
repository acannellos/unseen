extends Node

var SCENE_XFER_SCENE = preload("res://scenes/ui/scene_xfer.tscn")
var scene_xfer: Control

var scene_dictionary  = {
	"train" : "res://scenes/game/01_train.tscn",
	"alley" : "res://scenes/game/02_alley.tscn",
	"town" : "res://scenes/game/03_town.tscn",
}

var last_scene: String = ""

func _ready() -> void:
	scene_xfer = SCENE_XFER_SCENE.instantiate()
	add_child(scene_xfer)

func change_scene(from_scene: String, to_scene: String) -> void:
	last_scene = from_scene
	var to_scene_path = scene_dictionary.get(to_scene)
	get_tree().change_scene_to_file(to_scene_path)
