extends Node

enum GameState {PLAYING, DIALOGUE}
var game_state: GameState = GameState.PLAYING

func _ready() -> void:
	await get_tree().physics_frame
	DialogueManager.connect("dialogue_started", _on_dialogue_started)

func _on_dialogue_started(resource: DialogueResource) -> void:
	print("you did it")


var has_moved: bool = false

func _physics_process(delta: float) -> void:
	if not has_moved:
		var input_dir: Vector2 = Input.get_vector("left", "right", "forward", "backward")
		if input_dir:
			has_moved = true
			print(has_moved)
