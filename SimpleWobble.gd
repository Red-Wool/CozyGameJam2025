extends Sprite2D

@export var power : float = 10.
@export var pos : float = 0.
var timer : float

func _process(delta):
	timer += delta*.5
	position.y = pos+sin(timer)*power
