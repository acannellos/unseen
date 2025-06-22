class_name InvisibleSign
extends Area3D

@export var body: StaticBody3D
@export var interactable: InteractableComponent
@export var dialogue: DialogueResource

var count_overlaps: int = 0

func _ready() -> void:
	interactable.connect("interacted", _on_interacted)

func _physics_process(delta: float) -> void:

	#if visible:
	if count_overlaps > 0:
		show()
		body.set_collision_layer_value(2, true)
	else:
		hide()
		body.set_collision_layer_value(2, false)
	
	count_overlaps = 0

func _on_interacted() -> void:
	if visible:
		DialogueManager.show_example_dialogue_balloon(dialogue, "start")
