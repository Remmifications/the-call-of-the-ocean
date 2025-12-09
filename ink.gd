extends Area2D

var speed = 300
const EXPLOSION_2 = preload("uid://bqugmg38hc4se")
const PUDDLE = preload("res://puddle.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_as_top_level(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += (Vector2.RIGHT * speed).rotated(rotation) * delta
	
	
func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()

func kill():
	var explosions = EXPLOSION_2.instantiate()
	explosions.position = global_position
	explosions.rotation = global_rotation
	explosions.emitting = true
	get_tree().current_scene.add_child(explosions)
	var puddles = PUDDLE.instantiate()
	puddles.position = global_position
	puddles.rotation = global_rotation
	get_tree().current_scene.add_child(puddles)

func _on_body_entered(body: Node2D) -> void:
	kill()
	queue_free()
