class_name Camera extends Camera2D

@export var follow : Node2D

func _process(delta):
	global_position = lerp(global_position, follow.global_position, delta)
