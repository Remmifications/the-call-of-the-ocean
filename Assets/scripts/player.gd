extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var healthbar: HBoxContainer = $"../HUD/healthbar"
@export var max_health = 6
var health = 6
var shot_cooldown = true
var waterproj = preload("res://Assets/scenes/water.tscn")
var inkproj = preload("res://ink.tscn")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	healthbar.update_partial(health)
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction > 0:
		animated_sprite_2d.flip_h = false
		
	if direction < 0:
		animated_sprite_2d.flip_h = true
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		

	move_and_slide()
	
	
	var mouse_position = get_global_mouse_position()
	$Marker2D.look_at(mouse_position)
	
	
	if Input.is_action_just_pressed("left_mouse") and shot_cooldown:
		shot_cooldown = false
		var water_instance = waterproj.instantiate()
		water_instance.rotation = $Marker2D.rotation
		water_instance.global_position = $Marker2D.global_position
		add_child(water_instance)
		
		await get_tree().create_timer(0.5).timeout
		shot_cooldown = true
		
	if Input.is_action_just_pressed("right_mouse") and shot_cooldown:
		shot_cooldown = false
		var ink_instance = inkproj.instantiate()
		ink_instance.rotation = $Marker2D.rotation
		ink_instance.global_position = $Marker2D.global_position
		add_child(ink_instance)
		
		await get_tree().create_timer(0.5).timeout
		shot_cooldown = true
		
		
