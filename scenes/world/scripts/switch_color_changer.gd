extends MeshInstance3D

@export var interactable_body: InteractableBody

@export var color_green: StandardMaterial3D

func _ready() -> void:
	if Global.flag_train_switch_01:
		set_surface_override_material(0, color_green)
	if interactable_body:
		interactable_body.interacted.connect(_on_interacted)

func _on_interacted() -> void:
	Global.flag_train_switch_01 = true
	set_surface_override_material(0, color_green)
