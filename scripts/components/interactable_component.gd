class_name InteractableComponent
extends Node

signal interacted()

func interact_with() -> void:
	interacted.emit()
