extends Node

enum GameState {PLAYING, DIALOGUE}
var game_state: GameState = GameState.PLAYING
var is_speaking: bool = false

func _ready() -> void:
	await get_tree().physics_frame
	DialogueManager.connect("dialogue_started", _on_dialogue_started)
	DialogueManager.connect("dialogue_ended", _on_dialogue_ended)

func _on_dialogue_started(resource: DialogueResource) -> void:
	is_speaking = true
	print(is_speaking)

func _on_dialogue_ended(resource: DialogueResource) -> void:
	is_speaking = false
	print(is_speaking)

var has_moved: bool = false
var flag_train_dialogue_01: bool = false

func _physics_process(delta: float) -> void:
	if not has_moved:
		var input_dir: Vector2 = Input.get_vector("left", "right", "forward", "backward")
		if input_dir:
			has_moved = true
			print(has_moved)
