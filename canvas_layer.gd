extends CanvasLayer

@onready var ammo: Label = $ammo
@onready var money: Label = $money
@onready var player: CharacterBody2D = $"../Player"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	ammo.text = "Water = " + str(player.water) + "/" + str(player.max_water)
	
