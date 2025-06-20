extends ShapeCast3D

@onready var spinning_box: MeshInstance3D = $spinning_box

#func _ready() -> void:
	#connect("body_entered", _on_entered)
	#connect("body_exited", _on_exited)
#
#func _on_entered() -> void:
	#spinning_box.show()
	#print("enter")
	#pass
#
#func _on_exited() -> void:
	#spinning_box.hide()
	#print("exit")
	#pass

#func _physics_process(delta: float) -> void:
	#if spinning_box.visible:
		#spinning_box.hide()

func _physics_process(delta: float) -> void:
	spinning_box.hide()
	for i in get_collision_count():
		spinning_box.show()

#func show_box() -> void:
	#spinning_box.show()
