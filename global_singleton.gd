extends Node

@export var max_water = 10
@export var max_ink = 5
var money = 0
var ink = 5
var water = 10


func update_money(egg):
	money = str(egg)
	
func update_wammo(wammo):
	wammo = "Water = " + str(wammo) + "/ 10"
	
func update_iammo(iammo):
	iammo.text = "Ink =" + str(iammo) + "/ 5"
