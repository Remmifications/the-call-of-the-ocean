extends TextureButton
class_name shot_cool_display

# Icon found at https://game-icons.net/tags/gun.html
@onready var time_label: Label = $Value
@onready var cooldown = 0.8
@onready var timer: Timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = cooldown
	time_label.hide()
	$Sweep.texture_progress = texture_normal
	$Sweep.value = 0
	set_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_label.text = "%3.1f" % timer.time_left
	$Sweep.value = int((timer.time_left / cooldown) * 100)

func cooldown_start() -> void:
	disabled = true
	print("timers started")
	set_process(true)
	timer.start()
	time_label.show()
	

func _on_pressed() -> void:
	disabled = true
	set_process(true)
	timer.start()
	time_label.show()


func _on_timer_timeout() -> void:
	print("timers finished")
	$Sweep.value = 0
	disabled = false
	time_label.hide()
	set_process(false)
