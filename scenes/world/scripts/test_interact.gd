extends MeshInstance3D

@export var interactable: InteractableComponent
@export var spinning_box: MeshInstance3D

@export var dialogue: DialogueResource

func _ready() -> void:
	interactable.connect("interacted", _on_interacted)

func _on_interacted() -> void:
	DialogueManager.show_example_dialogue_balloon(dialogue, "start")
	print(name)

func _physics_process(delta: float) -> void:
	spinning_box.rotate_y(delta)
