extends Area2D

@onready var timer: Timer = $Timer
@onready var sound: AnimationPlayer = $sound


func _on_body_entered(body):
	print("You died!")
	sound.play("deathsound")
	timer.start()
	

func _on_timer_timeout():
	get_tree().reload_current_scene()
