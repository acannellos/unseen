extends ShapeCast3D

func _physics_process(delta: float) -> void:
	
	if Global.is_speaking:
		return
	
	for i in get_collision_count():
		
		var collider = get_collider(i)
		var interactable = collider.get_node_or_null("InteractableComponent")
		
		if interactable:
			Events.interactable_reached.emit()

			if Input.is_action_just_pressed("interact"):
				interactable.interact_with()
