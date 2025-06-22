extends Node

var player: Player
#var player_needs_first_movement: bool = true

var is_speaking: bool = false
var is_light_on: bool = false

var flag_train_dialogue_01: bool = false

func _ready() -> void:
	await get_tree().physics_frame
	DialogueManager.connect("dialogue_started", _on_dialogue_started)
	DialogueManager.connect("dialogue_ended", _on_dialogue_ended)

#func _physics_process(delta: float) -> void:
	#if player:
		#if player_needs_first_movement and Input.get_vector("left", "right", "forward", "backward"):
			#player.footsteps.playing = true
			#player_needs_first_movement = false

func _on_dialogue_started(resource: DialogueResource) -> void:
	is_speaking = true

func _on_dialogue_ended(resource: DialogueResource) -> void:
	is_speaking = false
