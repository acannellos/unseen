extends Label

var is_interactable_reached: bool = false

func _ready() -> void:
	Events.connect("interactable_reached", _on_interactable_reached)

func _on_interactable_reached() -> void:
	is_interactable_reached = true

func _physics_process(delta: float) -> void:
	
	if is_interactable_reached:
		show()
	else:
		hide()
	
	if Global.is_speaking:
		hide()
	
	is_interactable_reached = false
