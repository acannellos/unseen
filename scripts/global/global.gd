extends Node

var player: Player

var is_speaking: bool = false
var is_light_on: bool = false

var flag_train_dialogue_01: bool = false

func _ready() -> void:
	await get_tree().physics_frame
	DialogueManager.connect("dialogue_started", _on_dialogue_started)
	DialogueManager.connect("dialogue_ended", _on_dialogue_ended)

func _on_dialogue_started(resource: DialogueResource) -> void:
	is_speaking = true

func _on_dialogue_ended(resource: DialogueResource) -> void:
	is_speaking = false
