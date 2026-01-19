extends RigidBody2D

@export var speed : float = 200
@export var cannon_ball_scene : PackedScene

var velocity

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ShootTimer.timeout.connect(_shoot)


# We are using a RigidBody, apply_central_force must be applied in the Physics Process Function
#func _process(delta: float) -> void:
func _physics_process(delta: float) -> void:
	# Decplacement :
	velocity = Vector2.ZERO
	if Input.is_action_pressed("player_move_left"):
		velocity += Vector2(-speed, 0)
	if Input.is_action_pressed("player_move_right"):
		velocity += Vector2(speed, 0)
	if Input.is_action_pressed("player_move_up"):
		velocity += Vector2(0, -speed)
	if Input.is_action_pressed("player_move_down"):
		velocity += Vector2(0, speed)
	if velocity.length() > 0:
		apply_central_force(velocity)
		rotation = velocity.angle() # Orient le bateau dans le sens de sa velocites
	
	
func _shoot():
	var cannon_ball = cannon_ball_scene.instantiate()
	cannon_ball.position = position + Vector2(0, 20).rotated(rotation)
	cannon_ball.rotation = rotation + PI / 2 
	cannon_ball.initial_velocity = velocity
	get_tree().root.add_child(cannon_ball)
	
	
