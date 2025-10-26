extends Node2D

func _process(delta):
	rotation += 1.5 * delta
	position.x += -1
	
	pass
