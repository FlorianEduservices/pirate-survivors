extends RigidBody2D

@export var speed : float = 200
@export var cannon_ball_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ShootTimer.timeout.connect(_shoot)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Decplacement :
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("player_move_left"):
		velocity += Vector2(-speed, 0)
	if Input.is_action_pressed("player_move_right"):
		velocity += Vector2(speed, 0)
	if Input.is_action_pressed("player_move_up"):
		velocity += Vector2(0, -speed)
	if Input.is_action_pressed("player_move_down"):
		velocity += Vector2(0, speed)
	apply_central_force(velocity)
	
func _shoot():
	var cannon_ball = cannon_ball_scene.instantiate()
	cannon_ball.position = position + Vector2(30, 0)
	get_tree().root.add_child(cannon_ball)
	
	
