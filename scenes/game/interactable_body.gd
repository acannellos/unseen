class_name InteractableBody
extends StaticBody3D

signal interacted

@export var dialogue: DialogueResource
@export var use_signal: bool = false

func interact_with() -> void:
	if dialogue:
		DialogueManager.show_example_dialogue_balloon(dialogue, "start")
	
	if use_signal:
		Audio.play("sounds/light_switch_on.wav")
		interacted.emit()
