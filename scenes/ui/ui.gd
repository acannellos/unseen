extends CanvasLayer

@export var location_label: Label

func _ready() -> void:
	location_label.text = Scenes.current_scene
	
