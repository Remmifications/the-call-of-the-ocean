extends CharacterBody2D

@onready var player: CharacterBody2D = $"."

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group ("player"):
		Global.money = int(Global.money) + 1
		Global.update_money(Global.money)
		print("+1 egg point")
		queue_free()
		
