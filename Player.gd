class_name Player extends CharacterBody2D

@onready var visual : Sprite2D = $Visual
@onready var collision : CollisionShape2D = $Collision
@onready var raycast : RayCast2D = $Raycast


@export var speed : float
@export var gravity : float
@export var jump_power : float

var can_jump : bool = true
var current_gravity : float

func _physics_process(delta):
	var move : float = Input.get_axis("left", "right")
	
	current_gravity += gravity * delta
	
	#Ground Check
	if raycast.is_colliding():
		current_gravity = min(0, current_gravity)
		can_jump = true
	else:
		can_jump = false
	
	#Jumping
	if Input.is_action_just_pressed("jump") and can_jump:
		current_gravity = -jump_power
		can_jump = false
	
	#Gliding
	if Input.is_action_just_pressed("glide"):
		pass #Implement Gliding here
	
	velocity = Vector2(move * speed, current_gravity) * delta
	move_and_slide()
