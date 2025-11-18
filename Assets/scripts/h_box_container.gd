extends HBoxContainer

const WATER_HEALTH_FULL = preload("res://Assets/sprites/WaterHealth-full.png")
const WATER_HEALTH_HALF = preload("res://Assets/sprites/WaterHealth-half.png")
const WATER_HEALTH_EMPTY = preload("res://Assets/sprites/WaterHealth-empty.png")


func update_partial(value):
	for i in get_child_count():
		if value > i * 2 + 1:
			get_child(i).texture = WATER_HEALTH_FULL
		elif value > i * 2:
			get_child(i).texture = WATER_HEALTH_HALF
		else:
			get_child(i).texture = WATER_HEALTH_EMPTY
