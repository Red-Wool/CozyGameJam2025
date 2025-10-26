class_name LittleGuy extends Area2D

@onready var sfx : AudioStreamPlayer2D = $SFX

func _on_area_entered(area):
	if area.is_in_group("Obstacles"):
		print("blocked")
	if area.is_in_group("Interactables"):
		print("collected")


func _on_body_entered(body):
	if body is Player:
		sfx.play()
