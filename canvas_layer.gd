extends CanvasLayer

@onready var player: CharacterBody2D = $"../Player"
@onready var money: Label = $money
@onready var wammo: Label = $Wammo
@onready var iammo: Label = $Iammo
@onready var global_singleton: CanvasLayer = $"."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	money.text = "x" + str(Global.money)
