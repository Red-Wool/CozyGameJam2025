class_name LittleGuy extends Area2D


func _on_area_entered(area):
	if area.is_in_group("Obstacles"):
		print("blocked")
	if area.is_in_group("Interactables"):
		print("collected")
