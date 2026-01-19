extends RigidBody2D

@export var speed : float = 200
@export var cannon_ball_scene : PackedScene
@export var max_life : float = 300.0

var score : int = 0
var current_life

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ShootTimer.timeout.connect(_on_shoot_timeout)
	current_life = max_life

# We are using a RigidBody, apply_central_force must be applied in the Physics Process Function
#func _process(delta: float) -> void:
func _physics_process(delta: float) -> void:
	# Decplacement :
	var force = Vector2.ZERO
	if Input.is_action_pressed("player_move_left"):
		force += Vector2(-speed, 0)
	if Input.is_action_pressed("player_move_right"):
		force += Vector2(speed, 0)
	if Input.is_action_pressed("player_move_up"):
		force += Vector2(0, -speed)
	if Input.is_action_pressed("player_move_down"):
		force += Vector2(0, speed)
	
	if force.length() > 0:
		apply_central_force(force)
		rotation = force.angle() # Orient le bateau dans le sens de sa velocites
	
func _on_shoot_timeout():
	_shoot(Vector2(0, 20), rotation + PI / 2)
	_shoot(Vector2(0, -20), rotation + (-PI) / 2)
	
func _shoot(socket : Vector2, cannon_ball_rotation : float):
	var cannon_ball = cannon_ball_scene.instantiate() # spawn
	cannon_ball.position = position + socket.rotated(rotation)
	cannon_ball.rotation = cannon_ball_rotation 
	cannon_ball.initial_velocity = linear_velocity
	get_tree().root.add_child(cannon_ball)
	
	# queue_free() #destroy the object
	
func update_score(additional_score : int):
	self.score += additional_score
	print("Player score: ", score)
