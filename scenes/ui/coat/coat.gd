extends Control

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var is_open: bool = false

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("coat_left"):
		animated_sprite_2d.play("open")
		if is_open:
			animated_sprite_2d.play("close")
			await animated_sprite_2d.animation_finished
			animated_sprite_2d.play("default")
			is_open = false
		else:
			animated_sprite_2d.play("open")
			await animated_sprite_2d.animation_finished
			is_open = true
