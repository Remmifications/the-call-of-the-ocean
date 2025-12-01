extends TextureButton
class_name reload_cool_display

# Icon found at https://game-icons.net/tags/gun.html
@onready var time_value: Label = $value
@onready var cooldown = 3
@onready var timer: Timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = cooldown
	time_value.hide()
	$sweep.texture_progress = texture_normal
	$sweep.value = 0
	set_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_value.text = "%3.1f" % timer.time_left
	$sweep.value = int((timer.time_left / cooldown) * 100)
	
func cooldown_start() -> void:
	disabled = true
	set_process(true)
	timer.start()
	time_value.show()


func _on_pressed() -> void:
	disabled = true
	set_process(true)
	timer.start()
	time_value.show()
	
func _on_timer_timeout() -> void:
	$sweep.value = 0
	disabled = false
	time_value.hide()
	set_process(false)
