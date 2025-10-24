class_name Player extends CharacterBody2D

@export var speed : float

func _physics_process(delta):
	var move : float = Input.get_axis("left", "right")
	
	velocity = Vector2(move * speed * delta,0)
	move_and_slide()
