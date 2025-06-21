extends Node3D

@export var light_label: Label

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("play"):
		Scenes.change_scene("main", "train")

func _physics_process(delta: float) -> void:
	pass
