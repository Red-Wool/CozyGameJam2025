@tool
class_name WindZone extends Area2D

@onready var collision : CollisionShape2D = $Collision
@onready var visual : Sprite2D = $Visual

@export var wind_area_size : Vector2:
	get:
		return wind_area_size
	set(value):
		wind_area_size = value
		if Engine.is_editor_hint():
			if !is_instance_valid(collision):
				return
			collision.shape.size = value
			visual.texture.width = value.x
			visual.texture.height = value.y
