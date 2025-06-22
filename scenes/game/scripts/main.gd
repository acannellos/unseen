extends Node3D

@export var light_label: RichTextLabel

var rich_text = "[Left Click] for [wave amp=20.0 freq=2.0 connected=1]flashlight[/wave]"

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("play"):
		Global.needs_first_click = false
		Scenes.change_scene("main", "train station")

func _physics_process(delta: float) -> void:
	if Global.is_light_on:
		light_label.text = " "
	else:
		light_label.text = rich_text
