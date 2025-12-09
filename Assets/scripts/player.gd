extends CharacterBody2D


var speed = 200.0
var jump_velocity = -400.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var healthbar: HBoxContainer = $"../HUD/healthbar"
@export var max_health = 6
var health = 6
var shot_cooldown = true
var waterproj = preload("res://Assets/scenes/water.tscn")
var inkproj = preload("res://ink.tscn")
@onready var shooting_button: shot_cool_display = $"../HUD/Shooting_button"
@onready var reload: reload_cool_display = $"../HUD/reload_cool_display"
var inked = false
@onready var timer: Timer = $Timer


func _physics_process(delta: float) -> void:
	# Add the gravity.
	healthbar.update_partial(health)
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
		print(velocity.y)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction > 0:
		animated_sprite_2d.flip_h = false
		
	if direction < 0:
		animated_sprite_2d.flip_h = true
	
	if direction:
		velocity.x = direction * speed
		print(velocity.x)
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		

	move_and_slide()
	
	
	
	if inked == true and speed == 200 and jump_velocity == -400:
		speed += 75
		jump_velocity -= 100
		timer.start()
	

	
	var mouse_position = get_global_mouse_position()
	$Marker2D.look_at(mouse_position)
	
	
	if Input.is_action_just_pressed("left_mouse") and shot_cooldown:
		shooting_button.cooldown_start()
		Global.water = int(Global.water) - 1
		Global.update_wammo(Global.water)
		shot_cooldown = false
		var water_instance = waterproj.instantiate()
		water_instance.rotation = $Marker2D.rotation
		water_instance.global_position = $Marker2D.global_position
		add_child(water_instance)
		
		await get_tree().create_timer(0.8).timeout
		shot_cooldown = true
		
	if Input.is_action_just_pressed("right_mouse") and shot_cooldown:
		shooting_button.cooldown_start()
		Global.ink = int(Global.ink) - 1
		Global.update_iammo(Global.ink)
		shot_cooldown = false
		var ink_instance = inkproj.instantiate()
		ink_instance.rotation = $Marker2D.rotation
		ink_instance.global_position = $Marker2D.global_position
		add_child(ink_instance)
		
		await get_tree().create_timer(0.8).timeout
		shot_cooldown = true
		
	if Global.ink == 0 and shot_cooldown == true:
		reload.cooldown_start()
		shot_cooldown = false
		
		await get_tree().create_timer(3).timeout
		Global.ink = Global.max_ink
		Global.water = Global.max_water
		shot_cooldown = true
	
	if Global.water == 0 and shot_cooldown == true:
		reload.cooldown_start()
		shot_cooldown = false
		
		await get_tree().create_timer(3).timeout
		Global.water = Global.max_water
		Global.ink = Global.max_ink
		shot_cooldown = true
		
		
		


func _on_timer_timeout() -> void:
	inked = false
	speed = 200
	jump_velocity = -400
	
