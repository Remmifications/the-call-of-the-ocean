extends TextureButton
class_name Shooting_button

# Icon found at https://game-icons.net/tags/gun.html

@onready var time_label = $Counter/Value

@onready var cooldown = 0.5	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	time_label.hide()
	$Sweep.value = 0
	$Sweep.texture_progress = texture_normal
	$Timer.wait_time = cooldown
	set_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_label.text = "%3.1f" % $Timer.time_left
	$Sweep.value = int(($Timer.time_left / cooldown) * 100)



func _on_pressed() -> void:
	disabled = true
	set_process(true)
	$Timer.start()
	time_label.show()


func _on_timer_timeout() -> void:
	print("ability ready")
	$Sweep.value = 0
	disabled = false
	time_label.hide()
	set_process(false)
