extends StaticBody2D

var sway_direction = -.1

func _process(delta):
	#rotation -= sway_direction * .2
	#i tried to make it sway a bit as it falls but it no work but the variable is here
	position.y += 1
	
	pass
