extends CanvasLayer

@export var location_label: Label
@export var color_rect: ColorRect
@export var interactable_body: InteractableBody

@export var animation_player: AnimationPlayer

func _ready() -> void:
	location_label.text = Scenes.current_scene
	if interactable_body:
		interactable_body.interacted.connect(_on_interacted)

func _on_interacted() -> void:
	if Global.flag_has_key:
		animation_player.play("end_game")
