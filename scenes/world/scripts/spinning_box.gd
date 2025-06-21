extends MeshInstance3D

#@export var body: Area3D

#func _ready() -> void:
	#body.connect("body_shape_entered", _on_enter)
	#body.connect("body_shape_exited", _on_exit)
#
#func _on_enter() -> void:
	#print("enter")
#
#func _on_exit() -> void:
	#print("exit")
