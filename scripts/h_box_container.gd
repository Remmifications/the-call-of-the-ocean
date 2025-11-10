extends HBoxContainer

const WATER_HEALTH_FULL = preload("res://sprites/WaterHealth-full.png")
const WATER_HEALTH_HALF = preload("res://sprites/WaterHealth-half.png")
const WATER_HEALTH_EMPTY = preload("res://sprites/WaterHealth-empty.png")


func update_health(value):
	for i in get_child_count():
		if value > i * 2 + 1:
			get_child(i).texture = WATER_HEALTH_FULL
		if value > i * 2:
			get_child(i).texture = WATER_HEALTH_HALF
		else:
			get_child(i).texture = WATER_HEALTH_EMPTY
