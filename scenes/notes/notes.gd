extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
var is_open: bool = false

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("notes"):
		if is_open:
			animation_player.play("close")
			await animation_player.animation_finished
			is_open = false
		else:
			animation_player.play("open")
			await animation_player.animation_finished
			is_open = true
