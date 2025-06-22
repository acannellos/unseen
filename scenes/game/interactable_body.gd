class_name InteractableBody
extends StaticBody3D

signal interacted

@export var dialogue: DialogueResource
@export var use_signal: bool = false
@export var is_end_game: bool = false
@export var end_dialogue: DialogueResource

func interact_with() -> void:
	if dialogue:
		if is_end_game and Global.flag_has_key:
			DialogueManager.show_example_dialogue_balloon(end_dialogue, "start")
		else:
			DialogueManager.show_example_dialogue_balloon(dialogue, "start")
	
	if use_signal:
		if not Global.flag_has_key:
			Audio.play("sounds/light_switch_on.wav")
		interacted.emit()
