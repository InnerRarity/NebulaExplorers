extends Area2D


var speed : float = 300.0

var movement : Vector2
var screen_size : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
# Cambiendo directamente la posición
	#if Input.is_action_pressed("down"):
		#position.y += speed
	#if Input.is_action_pressed("up"):
		#position.y -= speed
	#if Input.is_action_pressed("right"):
		#position.x += speed
	#if Input.is_action_pressed("left"):
		#position.x -= speed
		
# Empezando a pensar más en vectores
	movement = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		movement.x = 1
	if Input.is_action_pressed("left"):
		movement.x = -1
	if Input.is_action_pressed("down"):
		movement.y = 1
	if Input.is_action_pressed("up"):
		movement.y = -1
		
	position += movement * delta * speed
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if Input.is_action_just_pressed("shoot"):
		var shoot = preload("res://bullet.tscn").instantiate()
		owner.add_child(shoot)
		shoot.global_transform = $Cannon.global_transform
		
