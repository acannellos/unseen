class_name DialogueComponent
extends Node

@export var dialogue: DialogueResource

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		DialogueManager.show_example_dialogue_balloon(dialogue, "start")
