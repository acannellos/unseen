extends WorldLight

@export var interactable_body: InteractableBody

func _ready() -> void:
	if Global.flag_train_switch_01:
		visible = true
	if interactable_body:
		interactable_body.interacted.connect(_on_interacted)

func _on_interacted() -> void:
	if not visible:
		visible = true
