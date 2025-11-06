extends HBoxContainer


var heart_full = preload("res://sprites/WaterHealth-full.png")
var heart_empty = preload("res://sprites/WaterHealth-half.png")
var heart_half = preload("res://sprites/WaterHealth-empty.png")



func update_health(value):
	for i in range(get_child_count()):
		if value > i * 2 + 1:
			get_child(i).texture = heart_full
		if value > i * 2:
			get_child(i).texture = heart_half
		else:
			get_child(i).texture = heart_empty
